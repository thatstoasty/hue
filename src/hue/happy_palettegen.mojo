from random import randn_float64
from .color import Color, hsv, lab_to_hcl
from .soft_palettegen import soft_palette_ex, SoftPaletteSettings


fn fast_happy_palette(count: Int) -> List[Color]:
    """Uses the HSV color space to generate colors with similar S,V but distributed
    evenly along their Hue. This is fast but not always pretty.
    If you've got time to spare, use Lab (the non-fast below)."""
    var colors = List[Color](capacity=count)
    for i in range(count):
        colors.append(hsv(
            Float64(i) * (360.0 / Float64(count)), 
            0.8 + randn_float64() * 0.2,
            0.65 + randn_float64() * 0.2
        ))

    return colors


fn happy_palette(colors_count: Int) raises -> List[Color]:
    fn pimpy(l: Float64, a: Float64, b: Float64) -> Bool:
        var c: Float64
        _, c, _ = lab_to_hcl(l, a, b)
        return 0.3 <= c and 0.4 <= l and l <= 0.8

    return soft_palette_ex(colors_count, SoftPaletteSettings(pimpy, 50, True))
