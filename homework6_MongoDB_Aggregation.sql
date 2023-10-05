MongoDB
AGGREGATION FRAMEWORK

1   Разблокировать юзеров из France и Germany
    с положительным балансом($in:[]/$gt)
db.users.updateMany(
    { country: { $in: [ 'France', 'Germany'] } },
    { balance: { $gt: 0 } }
)
--Ответ на этот запрос:
--"MongoInvalidArgumentError: Update document requires atomic operators"

2   Вывести названия двух произвольных видео-роликов ($sample+$project)
db.videos.aggregate([
    { $sample: { size: 2 } },
    { $project: { title:1, _id:0 } }
])

3   Вывести юзеров, у которых есть видео-ролики($lookup/$match)
db.users.aggregate([
    { $lookup: { from: 'videos',
                 localField: '_id',
                 foreignField: 'author_id',
                 as: 'videos'
                } },
    { $match: { videos: { $ne: [] } } }
])

4   Используя метод aggregate(),
    вывести ко-во($count) юзеров без($match) видео-роликов($lookup)
db.users.aggregate([
        { $lookup: { from: 'videos',
                     localField: '_id',
                     foreignField: 'author_id',
                     as: 'videos'
                    } },
        { $match: { videos: [] } },
        { $count: "lazy_users" }
    ])
