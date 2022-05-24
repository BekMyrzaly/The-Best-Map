//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "JIHC",
            cityName: "Тараз",
            coordinates: CLLocationCoordinate2D(latitude: 42.918229053525046, longitude: 71.37319291471354),
            description: "Жамбылский инновационный колледж был образован в 1993 году. В колледже дается современное профессионально-техническое образование по программе, утвержденной Министерством образования и науки Республики Казахстан.",
            imageNames: [
                "67",
                "1",
            ],
            link: "http://jihc.kz/kz/"),
        
        Location(
            name: "Монумент Астана-Байтерек",
            cityName: "Нур-Султан",
            coordinates: CLLocationCoordinate2D(latitude: 51.12840097717836, longitude: 71.43052145581193),
            description: "Астана-Байтерек - один из главных символов страны, олицетворяющий её процветание и благополучие. По замыслу архитекторов эта достопримечательность Казахстана воплотила в себе идею трёхуровнего Дерева Мира, символизирующего антагонизм добра и зла, и объединяющего мир мёртвых, мир живых и небеса.",
            imageNames: [
                "bayterek_2",
                "bayterek_3",
                "bayterek_5",
            ],
            link: "https://putidorogi-nn.ru/aziya/74-monument-baiterek"),
        
        Location(
            name: "Хан-Шатыр",
            cityName: "Нур-Султан",
            coordinates: CLLocationCoordinate2D(latitude: 51.132604137695644, longitude: 71.40376248464767),
            description: "За недолгие годы своего существования ТРЦ Хан-Шатыр стал популярной достопримечательностью, к которой организуются целые экскурсии в Казахстане. Огромный 150-метровый “шатёр“ торгового центра виднеется уже издалека, органично вписываясь в архитектуру окружающих сооружений.",
            imageNames: [
                "han1",
                "han2",
                "han3",
            ],
            link: "http://www.khanshatyr.com/"),
        
        
        Location(
            name: "Мавзолей Ходжи Ахмеда Ясави",
            cityName: "Туркестан",
            coordinates: CLLocationCoordinate2D(latitude: 43.29779137191223, longitude: 68.27112145552924),
            description: "Мавзолей был построен в честь известного поэта Ахмеда Ясави в 1405 году в том месте, где ранее располагалась его скромная могила. Со временем этот архитектурный ансамбль объединил в себе самые разные помещения - усыпальницу, мечеть, библиотеку, пантеон казахских ханов с 43 надгробиями, баню и различные вспомогательные помещения.",
            imageNames: [
                "koja1",
                "koja2",
                "koja3",
            ],
            link: "https://www.wdl.org/ru/item/2468/"),
        
        Location(
            name: "Космодром Байконур",
            cityName: "Кызылордиская область",
            coordinates: CLLocationCoordinate2D(latitude: 45.920370778605516, longitude: 63.3415377844556),
            description: "На протяжении многих десятилетий космодром Байконур был и остаётся самой главной в мире площадкой для запуска космических летательных аппаратов. Именно отсюда происходил полёт первого человека в космос, запуск первого искусственного спутника, известных пилотируемых кораблей и орбитальных станций, а также других космических аппаратов, по сей день бороздящих просторы Солнечной системы.",
            imageNames: [
                "baikonur1",
                "baikonur2",
                "baikonur3",
            ],
            link: "http://baikonur.russian.space/"),
        
        
        Location(
            name: "Дворец мира и согласия",
            cityName: "Нур-Султан",
            coordinates: CLLocationCoordinate2D(latitude: 51.12581331502446, longitude: 71.46567972697619),
            description: "Дворец мира и согласия - ещё одну достопримечательность Казахстана из категории необычных архитектурных сооружений. Здание выполнено в футуристическом стиле в форме правильной пирамиды высотой 62 метра, грани которой символизируют открытость казахского народа для всех наций и вероисповеданий.",
            imageNames: [
                "astana1",
                "astana2",
                "astana3",
            ],
            link: "http://astana-piramida.kz/"),
        
        
        Location(
            name: "Спортивный комплекс Медеу",
            cityName: "Алматы",
            coordinates: CLLocationCoordinate2D(latitude: 43.15744955510559, longitude: 77.05898669944055),
            description: "В горном урочище Медео расположился одноимённый спортивный комплекс - самый высокогорный в мире спорткомплекс, предназначенный для занятий зимними видами спорта. ",
            imageNames: [
                "medeu1",
                "medeu2",
            ],
            link: "http://medeu.com.kz/"),
        
        Location(
            name: "Мечеть Абу Насыра аль-Фараби",
            cityName: "Нур-Султан",
            coordinates: CLLocationCoordinate2D(latitude: 51.126675968037524, longitude: 71.41578497966947),
            description: "Абу Насыра аль-Фараби — мечеть, расположенная в Нур-Султане. До открытия мечети Хазрет Султан являлась самой большой мечетью в Казахстане и в Центральной Азии. Мечеть имеет четыре минарета высотой по 62 метра[2], высота главного купола 43 метра, а общая площадь равна 3930 м².",
            imageNames: [
                "farabi1",
                "farabi2"
            ],
            link: "https://ummet.kz/news-kz/14805-abu-nasyr-al-farabi-meshiti-salt-dasturdi-ulyktady.html?"),
        
        Location(
            name: "Мечеть Хазрет Султан",
            cityName: "Нур-Султан",
            coordinates: CLLocationCoordinate2D(latitude: 51.12614018267776, longitude: 71.47034218464742),
            description: "Самое крупное в Казахстане святилище находится в его столице и именуется Хазрет Султан. Это современная достопримечательность Казахстана, отсчёт истории которой начинается не так давно - в 2012 году. Как внешняя, так и внутренняя отделка мечети привлекает своей воздушностью, торжественностью, великолепной росписью и объёмным декором.",
            imageNames: [
                "m1",
                "m2",
                "m3"
            ],
            link: "http://www.muslim.kz/ru"),
        
        
        Location(
            name: "Мавзолей Арыстан-Баба",
            cityName: "Отрарский район",
            coordinates: CLLocationCoordinate2D(latitude: 42.851866036452776, longitude: 68.26827455921286),
            description: "Мавзоле́й Арыстанба́ба — мавзолей на могиле учителя и духовного наставника Ходжи Ахмеда Ясави религиозного мистика и проповедника Арыстанбаба. Мавзолей расположен в 150 километрах от города Шымкента, недалеко от города Отрар и села Шаульдер Отырарского района. ",
            imageNames: [
                "arys1",
                "arys2",
                "arys3",
            ],
            link: "https://tengrinews.kz/mixnews/aryistan-bab-jizn-sotkannaya-iz-legend-353609/?"),
        
        
        Location(
            name: "Аксу-Жабаглинский заповедник",
            cityName: "Тюлькубас",
            coordinates: CLLocationCoordinate2D(latitude: 42.30163019341024, longitude: 70.67434414787289),
            description: "Заповедник Аксу-Джабаглы - невероятное по красоте место, где открывается всё великолепие природы гор: это и снежные шапки самых высоких горных вершин, и захватывающие дух ущелья. и стремительные водопады, и альпийские луга. Земли этих территорий богаты на ископаемые останки растений и животных юрского периода",
            imageNames: [
                "aksu1",
                "aksu2",
                "aksu3",
            ],
            link: "http://www.aksu-jabagly.kz/"),
        
        Location(
            name: "Курорт Бурабай",
            cityName: "Акмолинская область",
            coordinates: CLLocationCoordinate2D(latitude: 53.07541924130363, longitude: 70.2770086433724),
            description: "Бурабай — климато-кумысолечебный курорт с 1910 года в Акмолинской области Казахстана. Входит в состав Боровской поселковой администрации. Возведён у одноимённого озера. Санатории, грязелечебницы и так далее. Сезон — круглый год.",
            imageNames: [
                "bura1",
                "bura2",
                "bura3",
            ],
            link: "https://borovoe.kz"),
        
        Location(
            name: "Мавзолей Айша Биби",
            cityName: "Тараз",
            coordinates: CLLocationCoordinate2D(latitude: 42.83403396295698, longitude: 71.21065857085607),
            description: "Айша-Биби — мавзолей эпохи Караханидов, XII века постройки, расположенный в селе Айша-Биби Жамбылского района Жамбылской области в 18 км от города Тараза. Является памятником архитектуры республиканского значения. Основание мавзолея — кубическое. По его четырём углам размещены массивные колонны.",
            imageNames: [
                "aisha1",
                "aisha2",
                "aisha3"
            ],
            link: "https://www.tourister.ru/world/asia/kazakhstan/city/taraz/placeofinterest/25924?"),
        
        Location(
            name: "Мавзолей Карахан",
            cityName: "Тараз",
            coordinates: CLLocationCoordinate2D(latitude: 42.87740685011647, longitude: 71.41880922983006),
            description: "Мавзолей Карахана — памятник архитектуры XI века в казахстанском городе Таразе. Сооружён над могилой одного из представителей династии Караханидов.",
            imageNames: [
                "karahan1",
                "karahan2",
                "karahan3",
            ],
            link: "https://www.tourister.ru/world/asia/kazakhstan/city/taraz/placeofinterest/25925?"),
        
        
        Location(
            name: "Мавзолей Тектурмас",
            cityName: "Тараз",
            coordinates: CLLocationCoordinate2D(latitude: 51.12581331502446, longitude: 71.400000),
            description: "Мавзолей Тектурмас — памятник архитектуры XIV—XV века, расположенный на юго-восточной окраине города Тараза на правом берегу реки Талас на вершине холма Тектурмас. Зодчий и строитель мавзолея неизвестны. Среди местных жителей мавзолей считается местом захоронения святого Султан-Махмуд-хана",
            imageNames: [
                "tek1",
                "tek2",
                "tek3",
            ],
            link: "https://www.inform.kz/ru/tekturmas-zagadochnoe-mesto-sily-i-palomnichestva-v-zhambylskoy-oblasti_a3022147?"),
        
        
    ]
    
}
