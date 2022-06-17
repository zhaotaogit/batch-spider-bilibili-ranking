# -*- coding: utf-8 -*-
"""
Created on 2021-02-08 16:02:02
---------
@summary: 爬虫入口
---------
@author: Boris
"""
from spiders import spider_all_station
from feapder import ArgumentParser


# 全站排行榜
def crawl_spider(args):
    spider = spider_all_station.TestSpider(
        redis_key="feapder:spider_batch_spider",  # redis中存放任务等信息的根key
        task_table="batch_spider_task",  # mysql中的任务表
        task_keys=["id", "url", "rid", "type", "day", "season_type"],  # 需要获取任务表里的字段名，可添加多个
        task_state="state",  # mysql中任务状态字段
        batch_record_table="batch_spider_batch_record",  # mysql中的批次记录表
        batch_name="b站全站排行榜(zhtao)",  # 批次名字
        batch_interval=1,  # 批次周期 天为单位 若为小时 可写 1 / 24
    )

    if args == 1:
        spider.start_monitor_task()  # 下发及监控任务
    else:
        spider.start()  # 采集


if __name__ == "__main__":
    parser = ArgumentParser(description="批次爬虫测试")

    parser.add_argument("--crawl_spider", type=int, nargs=1, help="(1|2）", function=crawl_spider)
    parser.start()

    # 运行
    # 下发任务及监控进度 python3 main.py --crawl_test 1
    # 采集 python3 main.py --crawl_test 2
