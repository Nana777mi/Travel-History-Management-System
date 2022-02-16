--         table creation script
create table if not exists district
(
    `district_name` varchar(100),
    `region` varchar(10),
    primary key (`district_name`)
)engine = InnoDB default charset = utf8;

create table if not exists hospital
(
    `hospital_name` varchar(100),
    `district` varchar(100),
    primary key (`hospital_name`),
    constraint fk_hospital foreign key (district) references district (district_name)
)engine = InnoDB default charset = utf8;

create table if not exists doctor
(
    `id` int,
    `doctor` varchar(100),
    `hospital` varchar(100),
    primary key (id),
    constraint fk_doctor foreign key (`hospital`) references hospital(`hospital_name`)
)engine = InnoDB default charset = utf8;

create table if not exists person
(
    `mobile` varchar(20),
    `name` varchar(50),
    `sex` varchar(10),
    `age` int check ( age >= 0 ),
    primary key (`mobile`)
)engine = InnoDB default charset = utf8;

create table if not exists sample
(
    `sample_type` varchar(30),
    `description` varchar(255),
    primary key (`sample_type`)
)engine = InnoDB default charset = utf8;

create table if not exists viral_test_result
(
    `hospital` varchar(100),
    `mobile` varchar(20),
    `sample_type` varchar(30),
    `test_result` char(8) check (test_result = 'positive' or test_result = 'negative'),
    `sample_collect_time` datetime,
    `doctor` varchar(100),
    `sample_test_time` datetime,
    `report_time` datetime,
    primary key (mobile, sample_collect_time),
    constraint fk_vtr1 foreign key (mobile) references person (mobile),
    constraint fk_vtr2 foreign key (sample_type) references sample (sample_type),
    constraint fk_vtr3 foreign key (hospital) references hospital (hospital_name)
)engine = InnoDB default charset = utf8;

create table if not exists mobile_base_station
(
    `location` varchar(255),
    `district` varchar(100),
    primary key (`location`),
    constraint fk_mbs foreign key (district) references district (district_name)
)engine = InnoDB default charset = utf8;

create table if not exists travel_history
(
    `mobile` varchar(20),
    `district` varchar(100),
    `arrive_time` datetime,
    `leave_time` datetime,
    primary key (mobile, arrive_time),
    constraint fk_th1 foreign key (mobile) references person (mobile),
    constraint fk_th2 foreign key (district) references district (district_name)
)engine = InnoDB default charset = utf8;


--         Important use cases
--  !!! both test data and SELECT statements are needed

-- test data
insert into district values
('Wind dragon ruins', 'west'),
('Crown Ming Gorge', 'west'),
('High Land', 'central'),
('M Town', 'east'),
('A Street', 'north'),
('S Pool', 'south'),
('Centre Lukewarm Hillside', 'central');

insert into hospital values
('A-soul hospital', 'Centre Lukewarm Hillside'),
('Holo-live hospital', 'Crown Ming Gorge'),
('Fragrance hospital', 'High Land'),
('Dicky Twister hospital', 'Wind dragon ruins');

insert into doctor values
(0, 'Danny', 'A-soul hospital'),
(1, 'a', 'A-soul hospital'),
(2, 'b', 'A-soul hospital'),
(3, 'c', 'Holo-live hospital'),
(4, 'b', 'Fragrance hospital');

insert into person values
('233636', 'Mark', 'male', 24),
('114514', 'Senpai', 'male', 24),
('191981', 'Rachel', 'female', 14),
('112233', 'Zack', 'male', 18),
('223344', 'Diana', 'male', 17),
('334455', 'Lisa', 'female', 32);

insert into sample values
('Coughid-21', 'Coughid-21 is a new type of virus this year, all patients tested to be positive should rest well and avoid going outside'),
('Coughid-20', 'no comment'),
('Coughid-19', 'no comment'),
('Coughid-18', 'no comment');

insert into viral_test_result values
('A-soul hospital','233636', 'Coughid-21', 'positive', '2021-10-09 19:30:00', 'Danny', '2021-10-09 19:35:00', '2021-10-09 20:30:00'),
('A-soul hospital','114514', 'Coughid-21', 'negative', '2021-09-09 19:30:00', 'Danny', '2021-09-09 19:35:00', '2021-09-09 20:35:00'),
('A-soul hospital','114514', 'Coughid-21', 'positive', '2021-10-04 10:30:00', 'Danny', '2021-10-04 15:35:00', '2021-10-04 16:35:00'),
('A-soul hospital','191981', 'Coughid-21', 'negative', '2021-10-01 19:30:00', 'Danny', '2021-10-01 19:40:00', '2021-10-01 20:30:00'),
('Holo-live hospital','112233', 'Coughid-21', 'negative', '2021-10-02 19:30:00', 'c', '2021-10-02 19:30:00', '2021-10-02 20:30:00'),
('Holo-live hospital','334455', 'Coughid-21', 'negative', '2021-10-03 19:30:00', 'c', '2021-10-03 19:30:00', '2021-10-03 20:30:00'),
('Fragrance hospital','334455', 'Coughid-21', 'negative', '2021-10-04 18:30:00', 'b', '2021-10-04 19:30:00', '2021-10-04 20:50:00'),
('Fragrance hospital','114514', 'Coughid-21', 'negative', '2021-10-03 10:00:00', 'b', '2021-10-03 19:30:00', '2021-10-03 20:30:00'),
('A-soul hospital','334455', 'Coughid-21', 'positive', '2021-10-05 19:30:00', 'Danny', '2021-10-05 20:30:00', '2021-10-05 21:40:00'),
('A-soul hospital','191981', 'Coughid-21', 'positive', '2021-10-03 23:30:00', 'Danny', '2021-10-04 21:30:00', '2021-10-04 22:40:00'),
('Holo-live hospital','191981', 'Coughid-21', 'positive', '2021-10-13 23:30:00', 'b', '2021-10-13 21:30:00', '2021-10-13 22:40:00')
;

insert into mobile_base_station values
('(110.122E, 24.233N)', 'Wind dragon ruins'),
('(110.123E, 24.234N)', 'Wind dragon ruins'),
('(110.122E, 24.234N)', 'Wind dragon ruins'),
('(110.135E, 24.235N)', 'Crown Ming Gorge'),
('(110.135E, 24.233N)', 'Crown Ming Gorge'),
('(110.124E, 24.243N)', 'High Land'),
('(110.142E, 24.245N)', 'M Town'),
('(110.122E, 24.247N)', 'A Street'),
('(110.145E, 24.237N)', 'S Pool')
;

insert into travel_history values
('112233', 'Wind dragon ruins', '2021-10-06 23:30:00', '2021-10-08 11:30:00'),
('223344', 'Wind dragon ruins', '2021-10-05 23:59:00', '2021-10-10 17:30:00'),
('334455', 'Wind dragon ruins', '2021-10-07 23:30:00', '2021-10-08 23:30:00'),
('114514', 'Wind dragon ruins', '2021-10-06 23:30:00', '2021-10-07 23:30:00'),
('233636', 'Crown Ming gorge', '2021-10-08 9:30:00', '2021-10-09 10:30:00'),
('114514', 'Crown Ming gorge', '2021-10-10 15:30:00', null),
('191981', 'Crown Ming gorge', '2021-10-07 23:30:00', '2021-10-09 10:30:00'),
('233636', 'High Land', '2021-10-09 10:30:00', '2021-10-10 00:30:00'),
('112233', 'High Land', '2021-10-08 11:30:00', '2021-10-10 10:30:00'),
('114514', 'M Town', '2021-10-07 20:30:00', '2021-10-10 15:30:00'),
('334455', 'A Street', '2021-10-08 23:30:00', '2021-10-10 12:30:00'),
('191981', 'S Pool', '2021-10-09 10:30:00', '2021-10-10 10:30:00'),
('112233', 'S Pool', '2021-10-10 10:30:00', null),
('223344', 'S Pool', '2021-10-10 17:30:00', null),
('191981', 'M Town', '2021-10-10 12:30:00', null)
;

-- use case 1

select
    distinct mobile
from (select
          district,arrive_time,leave_time
      from travel_history where mobile = '233636' and ((travel_history.arrive_time < '2021-10-09 19:30:00' and travel_history.leave_time > '2021-10-07 19:30:00') or (arrive_time < '2021-10-09 19:30:00' and travel_history.leave_time is null))
     ) th1
         left join travel_history th2 on th1.district = th2.district where th2.leave_time > th1.arrive_time and th2.arrive_time < th1.leave_time and mobile != '233636'
;

-- use case 2

insert into travel_history (mobile, district, arrive_time) values ('114514', 'A Street', now());
update travel_history set leave_time = now() where mobile = '114514' and leave_time is null;

-- use case 3

select
    t1.hospital
from (select
          hospital,min(t2.time)
      from (select
                hospital, avg(time_to_sec(timediff(report_time ,sample_test_time))) as time
            from viral_test_result group by hospital) t2) t1;


-- use case 4

select
    t1.mobile
from (select
          sub2.mobile,sub2.sample_collect_time
      from (select
                mobile
            from viral_test_result where sample_collect_time > '2021-10-03 00:00:00' and sample_collect_time < '2021-10-05 00:00:00'
            group by mobile
            having count(mobile) = 2) sub1
               left join (select
                              mobile, sample_collect_time
                          from viral_test_result where sample_collect_time > '2021-10-03 00:00:00' and sample_collect_time < '2021-10-05 00:00:00'
      ) sub2 on sub1.mobile = sub2.mobile) t1
         left join (select
                        sub2.mobile,sub2.sample_collect_time
                    from (select
                              mobile
                          from viral_test_result where sample_collect_time > '2021-10-03 00:00:00' and sample_collect_time < '2021-10-05 00:00:00'
                          group by mobile
                          having count(mobile) = 2) sub1
                             left join (select
                                            mobile, sample_collect_time
                                        from viral_test_result where sample_collect_time > '2021-10-03 00:00:00' and sample_collect_time < '2021-10-05 00:00:00'
                    ) sub2 on sub1.mobile = sub2.mobile) t2
                   on t1.mobile = t2.mobile
where timestampdiff(day,t1.sample_collect_time, t2.sample_collect_time) >= 1;


-- use case 5


select distinct district, 'high' as risk_level
from travel_history th
         left join
     (select mobile, max(report_time) as report_time
      from viral_test_result where test_result = 'positive' and timestampdiff(day,  report_time, '2021-10-16 00:00:00') < 7
      group by mobile
     ) rt on th.mobile = rt.mobile
where (leave_time between timestampadd(day, -2, report_time) and report_time or
       arrive_time between timestampadd(day, -2, report_time) and report_time or
       (arrive_time < timestampadd(day, -2, report_time) and leave_time is null)) and
    (timestampdiff(day,  arrive_time, leave_time) >= 1 or (th.leave_time is null and timestampdiff(day,  arrive_time, rt.report_time) >= 1)) and
        th.mobile in (select distinct mobile
                      from viral_test_result where test_result = 'positive' and timestampdiff(day, report_time, '2021-10-16 00:00:00') < 7)

union

select distinct district, 'mid' as risk_level
from travel_history th
         left join
     (select mobile, max(report_time) as report_time
      from viral_test_result where test_result = 'positive' and timestampdiff(day,  report_time, '2021-10-16 00:00:00') < 7
      group by mobile
     ) rt on th.mobile = rt.mobile
where (leave_time between timestampadd(day, -2, report_time) and report_time or
       arrive_time between timestampadd(day, -2, report_time) and report_time or
       (arrive_time < timestampadd(day, -2, report_time) and leave_time is null)) and
        th.mobile in (select distinct mobile
                      from viral_test_result where test_result = 'positive' and timestampdiff(day, report_time, '2021-10-16 00:00:00') < 7) and
        district not in (select distinct district
                         from travel_history th
                                  left join
                              (select mobile, max(report_time) as report_time
                               from viral_test_result where test_result = 'positive' and timestampdiff(day,  report_time, '2021-10-16 00:00:00') < 7
                               group by mobile
                              ) rt on th.mobile = rt.mobile
                         where (leave_time between timestampadd(day, -2, rt.report_time) and report_time or
                                arrive_time between timestampadd(day, -2, rt.report_time) and report_time or
                                (arrive_time < timestampadd(day, -2, report_time) and leave_time is null)) and
                             (timestampdiff(day,  arrive_time, leave_time) >= 1 or (th.leave_time is null and timestampdiff(day,  arrive_time, rt.report_time) >= 1)) and
                                 th.mobile in (select distinct mobile
                                               from viral_test_result where test_result = 'positive' and timestampdiff(day, report_time, '2021-10-16 00:00:00') < 7)
    )

union

select distinct district_name as district, 'low' as risk_level
from district where district_name not in
                    (
                        select distinct district
                        from travel_history th
                                 left join
                             (select mobile, max(report_time) as report_time
                              from viral_test_result
                              where test_result = 'positive'
                                and timestampdiff(day, report_time, '2021-10-16 00:00:00') < 7
                              group by mobile
                             ) rt on th.mobile = rt.mobile
                        where (leave_time between timestampadd(day, -2, report_time) and report_time or
                               arrive_time between timestampadd(day, -2, report_time) and report_time or
                               (arrive_time < timestampadd(day, -2, report_time) and leave_time is null))
                          and th.mobile in (select distinct mobile
                                            from viral_test_result
                                            where test_result = 'positive'
                                              and timestampdiff(day, report_time, '2021-10-16 00:00:00') < 7)
                    )
;





-- use case 6

select
    name,  p.mobile as mobile
from person p
         right join (select
                         distinct mobile
                     from viral_test_result where report_time >= '2021-10-04 00:00:00' and report_time < '2021-10-05 00:00:00' and test_result = 'positive' and hospital in (select hospital_name from hospital where district = 'Centre Lukewarm Hillside')) m
                    on p.mobile = m.mobile
;

-- use case 7

select
        cnt1 - cnt2 as dif
from (select
          count(m1.mobile) as cnt1
      from (select
                distinct mobile
            from viral_test_result where report_time >= '2021-10-05 00:00:00' and report_time < '2021-10-06 00:00:00' and test_result = 'positive' and hospital in (select hospital_name from hospital where district = 'Centre Lukewarm Hillside')
           ) m1) c1
         left join (select
                        count(m2.mobile) as cnt2
                    from (select
                              distinct mobile
                          from viral_test_result where report_time >= '2021-10-04 00:00:00' and report_time < '2021-10-05 00:00:00' and test_result = 'positive' and hospital in (select hospital_name from hospital where district = 'Centre Lukewarm Hillside')
                         ) m2) c2 on 1
;

-- use case 8
select
        cnt2 / cnt1 as spread_rate
from

    (select
         count(mobile) as cnt1
     from (select
               distinct mobile
           from (select
                     district,
                     leave_time,
                     arrive_time
                 from travel_history where mobile = '233636' and ((travel_history.arrive_time < '2021-10-09 19:30:00' and travel_history.leave_time > '2021-10-07 19:30:00') or (arrive_time < '2021-10-09 19:30:00' and travel_history.leave_time is null))
                ) th1
                    left join travel_history th2 on th1.district = th2.district where th2.leave_time > th1.arrive_time and th2.arrive_time < th1.leave_time and mobile != '233636'
          )t) t1

        left join (select
                       count(mobile) as cnt2
                   from viral_test_result
                   where report_time >= '2021-10-09 19:30:00' and report_time < '2021-10-23 19:30:00' and test_result = 'positive' and hospital in (
                       select
                           hospital_name
                       from hospital where district in (select
                                                            district
                                                        from travel_history
                                                        where mobile = '233636' and ((travel_history.arrive_time < '2021-10-09 19:30:00' and travel_history.leave_time > '2021-10-07 19:30:00') or (arrive_time < '2021-10-09 19:30:00' and travel_history.leave_time is null)))
                   )) t2 on 1
;


--          Extended use cases
--  !!! both test data and SELECT statements are needed

-- test data is the same as important use cases

-- use case 1

select
    *
from (select
          district, count(mobile) as count
      from (
               select mobile, district
               from travel_history
           ) s1
      group by district) cnt
where count = (select max(s2.count)
               from (
                        (select
                             count(mobile) as count
                         from (
                                  select mobile, district
                                  from travel_history
                              ) s1
                         group by district)
                    ) s2)
;

-- use case 2

select
    mobile
from viral_test_result
where test_result = 'positive'
group by mobile
having count(test_result) = 2;

-- use case 3

select
    mobile
from (select
          distinct p.mobile, age
      from viral_test_result
               left join person p
                         on p.mobile = viral_test_result.mobile
      where test_result = 'positive') s1
where age = (select min(age) from (select
                                       distinct age
                                   from viral_test_result
                                            left join person p
                                                      on p.mobile = viral_test_result.mobile
                                   where test_result = 'positive') s2)
;

-- use case 4

select
    mobile
from travel_history where arrive_time <= '2021-10-08 00:00:00' and (leave_time >= '2021-10-09 00:00:00' or leave_time is null )
;

-- use case 5

select
    district
from (select
          district, count(district) as count
      from viral_test_result
               left join hospital h on h.hospital_name = viral_test_result.hospital
      where test_result = 'positive'
      group by district) s2
where count = (select
                   max(count)
               from (select
                         district, count(district) as count
                     from viral_test_result
                              left join hospital h on h.hospital_name = viral_test_result.hospital
                     where test_result = 'positive'
                     group by district) s1)
;

-- use case 6

select
    mobile
from viral_test_result
         left join hospital h on h.hospital_name = viral_test_result.hospital
         left join district d on d.district_name = h.district
where test_result = 'positive' and region = 'central'
;

-- use case 7

select
    hospital, avg(time_to_sec(timediff(report_time, sample_collect_time))) as avg_time
from viral_test_result
group by hospital
order by avg_time desc
;

-- use case 8

select
    mobile
from viral_test_result
where report_time = (select
                         min(report_time)
                     from viral_test_result
                     where test_result = 'positive')
;

-- use case 9

select
    district
from travel_history
where mobile = '114514' and arrive_time < '2021-10-15 15:00:00' and (leave_time > '2021-10-08 15:00:00' or leave_time is null);

-- use case 10

select mobile
from travel_history where travel_history.district = 'Wind dragon ruins' and arrive_time < '2021-10-09 15:00:00' and (leave_time > '2021-10-09 15:00:00' or leave_time is null)
;

