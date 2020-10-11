# BabySSRF

## URL

`http://play.0ops.sjtu.cn.0.0.0.0.xip.name:8888/flag.php/.png`

* `any.domain.0.0.0.0.xip.name` resolves to `0.0.0.0`
* `/flag.php/.png` is equivalent to `/flag.php`, but forges the extension name
* use `http` rather than `https` to avoid `SSLError`

> 大概就只能做做 Baby 题了