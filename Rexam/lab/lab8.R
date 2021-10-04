url = "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text = read_html(url)

# 문제 1
(h1 = html_text(html_nodes(text, 'body > h1')))

# 문제 2
(a_href = html_attr(html_nodes(text, 'body >a'), 'href'))

# 문제 3
(img_src = html_attr(html_nodes(text, 'body img'), 'src'))

# 문제 4
(f_h2 = html_text(html_node(text, 'h2:nth-of-type(1)')))

# 문제 5
(green = html_text(html_node(text, '[style$=green]')))

# 문제 6
(s_h2 = html_text(html_node(text, 'h2:nth-of-type(2)')))

# 문제 7
(ol = html_text(html_nodes(text, 'ol li')))

# 문제 8
(table_text = html_text(html_nodes(text, 'table *')))

# 문제 9
(table_name = html_text(html_nodes(text, 'table .name')))

# 문제 10
(table_td_target = html_text(html_nodes(text, '#target')))
