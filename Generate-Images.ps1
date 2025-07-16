$colors = $colors = [System.Collections.Generic.Dictionary[string, System.Tuple[string, string]]]::new()
$colors.Add("black" , [System.Tuple]::Create("#636465", "#FFFFFF"))
$colors.Add("blue"  , [System.Tuple]::Create("#7DABFD", "#FFFFFF"))
$colors.Add("gray"  , [System.Tuple]::Create("#B5B5B4", "#000000"))
$colors.Add("green" , [System.Tuple]::Create("#89AE00", "#FFFFFF"))
$colors.Add("orange", [System.Tuple]::Create("#DC8600", "#FFFFFF"))
$colors.Add("purple", [System.Tuple]::Create("#936EA7", "#FFFFFF"))
$colors.Add("red"   , [System.Tuple]::Create("#E94335", "#FFFFFF"))
$colors.Add("white" , [System.Tuple]::Create("#F2F0EC", "#000000"))
$colors.Add("yellow", [System.Tuple]::Create("#E5B22E", "#000000"))

$baseImageFileName        = "base_image.png"
$baseImageBackgroundColor = "#000000"

$colors.Keys | ForEach-Object {
    $colorName       = $_
    $backgroundColor = $colors[$colorName].Item1
    $foregroundColor = $colors[$colorName].Item2
    for ($i = 1; $i -le 15; $i++) {
        $imageFileName = "marker_$($colorName)_$($i.ToString("00")).png"
        magick $baseImageFileName -fill $backgroundColor -opaque $baseImagebackgroundColor $imageFileName
        magick mogrify -font "Arial" -pointsize 16 -fill $foregroundColor -stroke $foregroundColor -strokewidth 0 -gravity Center -annotate "+0-10" $i $imageFileName
    }
}
