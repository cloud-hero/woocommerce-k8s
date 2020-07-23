# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule


class WoocommspiderSpider(CrawlSpider):
    handle_httpstatus_list = [403, 404]
    name = 'woocommspider'
    allowed_domains = ['woocommerce-wordpress.default.svc.cluster.local']
    start_urls = ['http://woocommerce-wordpress.default.svc.cluster.local/']

    rules = (
      Rule(
        LinkExtractor(
          tags='a',
          attrs='href',
          unique=True
        ),
        callback='parse_item',
        follow=True
      ),
    )

    def parse_item(self, response):
        pass