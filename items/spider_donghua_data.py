# -*- coding: utf-8 -*-
"""
Created on 2021-02-08 16:39:27
---------
@summary:
---------
@author: Boris
"""

from feapder import Item
'''
动画排行榜
'''
class SpiderDataItem(Item):
    """
    This class was generated by feapder.
    command: feapder create -i spider_data.
    """

    def __init__(self, *args, **kwargs):
        # 全站排行榜表面名
        self.table_name = 'spider_donghua_data'
        self.aid = None
        self.tname = None
        self.pic_url = None
        self.title = None
        self.desc1 = None
        self.author_mid = None
        self.author_name = None
        self.author_avatar_url = None
        self.video_view = None
        self.video_danmaku = None
        self.video_reply = None
        self.vide_favorite = None
        self.video_coin = None
        self.video_share = None
        self.video_like = None
        self.cid = None
        self.video_short_link = None
        self.video_short_link_v2 = None
        self.video_first_frame = None
        self.bvid = None
        self.score = None
        self.pubdate = None
        self.ranking = None
        self.data_create_time = None
