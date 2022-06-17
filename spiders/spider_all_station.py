# -*- coding: utf-8 -*-
"""
Created on 2021-02-08 16:09:47
---------
@summary:
---------
@author: Boris
"""
import sys
from datetime import datetime
import time

import feapder
from items import spider_all_station_data, spider_keji_data, spider_gcyuanchuang_data, spider_zhishi_data, \
    spider_youxi_data, spider_wudao_data, spider_yinyue_data, spider_donghua_data, spider_dongwuquan_data, \
    spider_guichu_data, spider_meishi_data, spider_shenghuo_data, spider_qiche_data, spider_yundong_data, \
    spider_xinren_data, spider_yule_data, spider_yuanchuang_data, spider_shishang_data, spider_yingshi_data


class TestSpider(feapder.BatchSpider):
    def start_requests(self, task):
        # task 为在任务表中取出的每一条任务
        id, url, rid, type, day, season_type = task  # id， url为所取的字段，main函数中指定的
        params = {
            'rid': rid,
            'type': type,
        }
        yield feapder.Request(url, task_id=id, params=params, callback=self.my_parse)

    def my_parse(self, request, response):
        items_lst = [spider_all_station_data, spider_keji_data, spider_gcyuanchuang_data, spider_zhishi_data,
                     spider_youxi_data, spider_wudao_data, spider_yinyue_data, spider_donghua_data,
                     spider_dongwuquan_data, spider_guichu_data, spider_meishi_data, spider_shenghuo_data,
                     spider_qiche_data, spider_yundong_data, spider_xinren_data, spider_yule_data,
                     spider_yuanchuang_data, spider_shishang_data, spider_yingshi_data]
        for j,i in enumerate(response.json['data']['list']):
            item = items_lst[request.task_id - 1].SpiderDataItem()
            item.aid = i['aid']
            item.tname = i['tname']
            item.pic_url = i['pic']
            item.title = i['title']
            item.desc1 = i['desc']
            item.author_mid = i['owner']['mid']
            item.author_name = i['owner']['name']
            item.author_avatar_url = i['owner']['face']
            item.video_view = i['stat']['view']
            item.video_danmaku = i['stat']['reply']
            item.video_reply = i['stat']['danmaku']
            item.vide_favorite = i['stat']['favorite']
            item.video_coin = i['stat']['coin']
            item.video_share = i['stat']['share']
            item.video_like = i['stat']['like']
            item.cid = i['cid']
            item.video_short_link = i['short_link']
            item.video_short_link_v2 = i['short_link_v2']
            try:
                item.video_first_frame = i['first_frame']
            except Exception as e:
                print(e)
                item.video_first_frame = 'null'
            item.bvid = i['bvid']
            item.ranking = j+1
            item.score = i['score']
            item.pubdate = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime(i['pubdate']))
            item.data_create_time = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M:%S')
            yield item  # 返回item， item会自动批量入库
        yield self.update_task_batch(request.task_id, 1)  # 更新任务状态为1

    def exception_request(self, request, response):
        """
        @summary: 请求或者parser里解析出异常的request
        ---------
        @param request:
        @param response:
        ---------
        @result: request / callback / None (返回值必须可迭代)
        """

        pass

    def failed_request(self, request, response):
        """
        @summary: 超过最大重试次数的request
        ---------
        @param request:
        ---------
        @result: request / item / callback / None (返回值必须可迭代)
        """

        yield request
        yield self.update_task_batch(request.task_id, -1)  # 更新任务状态为-1
