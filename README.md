# ZYTextCalculator

一行代码计算文字size<br>
/**<br>
 计算文字size<br>

 @param text 文字<br>
 @param font 字体和大小<br>
 @param lineSpacing 行间距 如果设置为0 则使用系统默认行间距<br>
 @param maxSize 最大容纳size CGSizeMake(控件宽度, MAXFLOAT) 则会返回 最接近控件宽度的宽度 和 容纳字体的完美容纳高度<br>
 @param numberOfLine 最大行数 设置为0则不限制行数计算 如果想计算指定行数的高度 设置此参数即可<br>
 @return 容纳size<br>
 */<br>
```
CGSize size = [ZYTextCalculator sizeWithText:TEXT font:font lineSpacing:lineSpacing maxSize:CGSizeMake(scrollView.frame.size.width, MAXFLOAT) numberOfLine:0];
```
