#!/usr/bin/python
import re
import urllib

def getHtml(url):
	page = urllib.urlopen(url)
	html = page.read()
	return html

def getImage(html):
	reg=r"<img .*? >"
	imgreg=re.compile(reg)
	imglist=re.findall(imgreg,html)
	return imglist

html = getHtml("http://tieba.baidu.com/f?ie=utf-8&kw=%E6%89%8B%E6%9C%BA%E5%A3%81%E7%BA%B8&red_tag=a2734339709")
print getImage(html)
