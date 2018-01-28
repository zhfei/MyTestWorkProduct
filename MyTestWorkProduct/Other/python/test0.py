#!/usr/bin/python
import re
import urllib

def getHtml(url):
	page = urllib.urlopen(url)
	html = page.read()
	return html
#src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4164570638,79571234&amp;fm=173&amp;s=6AAC3C6283C158E11E7CF0CF0100C0A0&amp;w=640&amp;h=440&amp;img.JPEG"
def getImage(html):
	reg=r'src="(.*?\.[JPEGpng]{3,4})"'
	imgreg=re.compile(reg)
	imglist=re.findall(imgreg,html)
	imageName=0
	for imgurl in imglist:
		urllib.urlretrieve(imgurl,"%s.JPEG"%imageName)
		imageName += 1


html = getHtml("https://www.baidu.com/home/news/data/newspage?nid=873177920096107971&n_type=0&p_from=1&dtype=-1")
getImage(html)
