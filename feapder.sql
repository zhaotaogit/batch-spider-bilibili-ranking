create table if not exists batch_spider_batch_record
(
    id            int(11) unsigned auto_increment
        primary key,
    batch_date    date                               null comment '批次时间',
    total_count   int                                null comment '任务总数',
    done_count    int                                null comment '完成数 (1,-1)',
    fail_count    int                                null comment '失败任务数 (-1)',
    `interval`    float                              null comment '批次间隔',
    interval_unit varchar(20)                        null comment '批次间隔单位 day, hour',
    create_time   datetime default CURRENT_TIMESTAMP null comment '批次开始时间',
    update_time   datetime default CURRENT_TIMESTAMP null comment '本条记录更新时间',
    is_done       int      default 0                 null comment '批次是否完成 0 未完成  1 完成'
);

create table if not exists batch_spider_task
(
    id          int unsigned auto_increment
        primary key,
    url         varchar(255)               null comment 'api url',
    state       int          default 0     null comment 'çˆ¬å–çŠ¶æ€',
    rid         int          default -1    null,
    type        varchar(20)  default ''    null,
    day         int          default -1    null,
    season_type int          default -1    null,
    `desc`      varchar(255) default ''    null comment 'æè¿°apiçš„ä½œç”¨',
    method      varchar(20)  default 'Get' null comment 'è¯·æ±‚ç±»åž‹'
);

create index batch_spider_task_id_index
    on batch_spider_task (id);

create table if not exists spider_all_station_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(1024)                       null comment 'è§†é¢‘æè¿°',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_donghua_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_dongwuquan_data
(
    id                  int            null,
    aid                 int            null,
    tname               varchar(255)   null,
    pic_url             varchar(255)   null,
    title               varchar(255)   null,
    desc1               varchar(255)   null comment '描述',
    author_mid          int            null,
    author_name         varchar(255)   null,
    author_avatar_url   varchar(255)   null,
    video_view          int            null,
    video_danmaku       int            null,
    video_reply         int            null,
    vide_favorite       int            null,
    video_coin          int            null,
    video_share         int            null,
    video_like          int            null,
    cid                 int            null,
    video_short_link    varchar(255)   null,
    video_short_link_v2 varchar(255)   null,
    video_first_frame   varchar(255)   null,
    bvid                int            null,
    score               int            null,
    data_create_time    timestamp      null,
    pubdate             timestamp      null comment '作品发布时间',
    ranking             int default -1 null
);

create table if not exists spider_gcyuanchuang_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_guichu_data
(
    id                  int            null,
    aid                 int            null,
    tname               varchar(255)   null,
    pic_url             varchar(255)   null,
    title               varchar(255)   null,
    desc1               varchar(255)   null comment '描述',
    author_mid          int            null,
    author_name         varchar(255)   null,
    author_avatar_url   varchar(255)   null,
    video_view          int            null,
    video_danmaku       int            null,
    video_reply         int            null,
    vide_favorite       int            null,
    video_coin          int            null,
    video_share         int            null,
    video_like          int            null,
    cid                 int            null,
    video_short_link    varchar(255)   null,
    video_short_link_v2 varchar(255)   null,
    video_first_frame   varchar(255)   null,
    bvid                int            null,
    score               int            null,
    data_create_time    timestamp      null,
    pubdate             timestamp      null comment '作品发布时间',
    ranking             int default -1 null
);

create table if not exists spider_keji_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_meishi_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_qiche_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_shenghuo_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_shishang_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_wudao_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_xinren_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_yingshi_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_yinyue_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_youxi_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_yuanchuang_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_yule_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_yundong_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

create table if not exists spider_zhishi_data
(
    id                  int auto_increment
        primary key,
    aid                 int                                 null comment 'è§†é¢‘aid',
    tname               varchar(255)                        null comment 'è§†é¢‘çš„æŸä¸€ä¸ªæ ‡ç­¾',
    pic_url             varchar(255)                        null comment 'è§†é¢‘å°é¢å›¾ç‰‡url',
    title               varchar(255)                        null comment 'è§†é¢‘æ ‡é¢˜',
    desc1               varchar(255)                        null comment '描述',
    author_mid          int                                 null comment 'ä½œè€…mid',
    author_name         varchar(255)                        null comment 'ä½œè€…åç§°',
    author_avatar_url   varchar(255)                        null comment 'ä½œè€…å¤´åƒurl',
    video_view          int                                 null comment 'è§†é¢‘æ’­æ”¾é‡',
    video_danmaku       int                                 null comment 'è§†é¢‘å¼¹å¹•æ•°',
    video_reply         int                                 null comment 'è§†é¢‘è¯„è®ºæ•°',
    vide_favorite       int                                 null comment 'è§†é¢‘æ”¶è—æ•°',
    video_coin          int                                 null comment 'è§†é¢‘ç¡¬å¸æ•°',
    video_share         int                                 null comment 'è§†é¢‘åˆ†äº«æ•°',
    video_like          int                                 null comment 'è§†é¢‘ç‚¹èµžæ•°',
    cid                 int                                 null comment 'cid',
    video_short_link    varchar(255)                        null comment 'è§†é¢‘çŸ­é“¾æŽ¥',
    video_short_link_v2 varchar(255)                        null,
    video_first_frame   varchar(255)                        null comment 'è§†é¢‘ç¬¬ä¸€å¸§å›¾ç‰‡url',
    bvid                int                                 null comment 'bvid
',
    score               int                                 null comment 'score',
    data_create_time    timestamp default CURRENT_TIMESTAMP null,
    pubdate             timestamp                           null comment '作品发布时间',
    ranking             int       default -1                null
);

