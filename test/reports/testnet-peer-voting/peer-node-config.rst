Lared node Version: CURRENT_VERSION

config-database.properties
==========================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **database**;
    databaseUri; mongodb://:27017
    databaseName; catapult
    maxWriterThreads; 8
    maxDropBatchSize; 10
    writeTimeout; 10m
    **plugins**;
    catapult.mongo.plugins.accountlink; true
    catapult.mongo.plugins.aggregate; true
    catapult.mongo.plugins.lockhash; true
    catapult.mongo.plugins.locksecret; true
    catapult.mongo.plugins.metadata; true
    catapult.mongo.plugins.mosaic; true
    catapult.mongo.plugins.multisig; true
    catapult.mongo.plugins.namespace; true
    catapult.mongo.plugins.restrictionaccount; true
    catapult.mongo.plugins.restrictionmosaic; true
    catapult.mongo.plugins.transfer; true

config-extensions-broker.properties
===================================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **extensions**;
    extension.addressextraction; true
    extension.mongo; true
    extension.zeromq; true
    extension.hashcache; true

config-extensions-recovery.properties
=====================================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **extensions**;
    extension.addressextraction; false
    extension.mongo; false
    extension.zeromq; false
    extension.filespooling; true
    extension.hashcache; true

config-extensions-server.properties
===================================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **extensions**;
    extension.filespooling; false
    extension.partialtransaction; false
    extension.addressextraction; false
    extension.mongo; false
    extension.zeromq; false
    extension.harvesting; true
    extension.syncsource; true
    extension.diagnostics; true
    extension.finalization; true
    extension.hashcache; true
    extension.networkheight; false
    extension.nodediscovery; true
    extension.packetserver; true
    extension.pluginhandlers; true
    extension.sync; true
    extension.timesync; true
    extension.transactionsink; true
    extension.unbondedpruning; true

config-finalization.properties
==============================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **finalization**;
    enableVoting; true
    enableRevoteOnBoot; true
    size; 10'000
    threshold; 7'000
    stepDuration; 4m
    shortLivedCacheMessageDuration; 10m
    messageSynchronizationMaxResponseSize; 20MB
    maxHashesPerPoint; 256
    prevoteBlocksMultiple; 4
    unfinalizedBlocksDuration; 0m

config-harvesting.properties
============================
.. csv-table::
    :header: "Property", "Value", "Type", "Description"
    :delim: ;

    **harvesting**; ; ;
    harvesterSigningPrivateKey; ****************************************************************; string; Harvester signing private key.
    harvesterVrfPrivateKey; ****************************************************************; string; Harvester vrf private key.
    enableAutoHarvesting; true; bool; Set to true if auto harvesting is enabled.
    maxUnlockedAccounts; 10; uint32_t; Maximum number of unlocked accounts.
    delegatePrioritizationPolicy; Importance; harvesting::DelegatePrioritizationPolicy; Delegate harvester prioritization policy.
    beneficiaryAddress; TDQ32MTJICEPJDU45KVN7BAM4A4GI7OARMLVSXQ; Address; Address of the account receiving part of the harvested fee.

config-inflation.properties
===========================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **inflation**;
    starting-at-height-2; 95998521
    starting-at-height-200; 91882261
    starting-at-height-400; 87942499
    starting-at-height-600; 84171668
    starting-at-height-800; 80562525
    starting-at-height-2537757; 77108135
    starting-at-height-3062757; 73801864
    starting-at-height-3587757; 70637360
    starting-at-height-4112757; 67608545
    starting-at-height-4637757; 64709601
    starting-at-height-5162757; 61934959
    starting-at-height-5687757; 59279289
    starting-at-height-6212757; 56737489
    starting-at-height-6737757; 54304678
    starting-at-height-7262757; 51976182
    starting-at-height-7787757; 49747528
    starting-at-height-8312757; 47614435
    starting-at-height-8837757; 45572806
    starting-at-height-9362757; 43618718
    starting-at-height-9887757; 41748419
    starting-at-height-10412757; 39958315
    starting-at-height-10937757; 38244967
    starting-at-height-11462757; 36605085
    starting-at-height-11987757; 35035519
    starting-at-height-12512757; 33533253
    starting-at-height-13037757; 32095402
    starting-at-height-13562757; 30719203
    starting-at-height-14087757; 29402014
    starting-at-height-14612757; 28141304
    starting-at-height-15137757; 26934650
    starting-at-height-15662757; 25779736
    starting-at-height-16187757; 24674343
    starting-at-height-16712757; 23616348
    starting-at-height-17237757; 22603717
    starting-at-height-17762757; 21634507
    starting-at-height-18287757; 20706854
    starting-at-height-18812757; 19818978
    starting-at-height-19337757; 18969173
    starting-at-height-19862757; 18155805
    starting-at-height-20387757; 17377314
    starting-at-height-20912757; 16632203
    starting-at-height-21437757; 15919041
    starting-at-height-21962757; 15236459
    starting-at-height-22487757; 14583144
    starting-at-height-23012757; 13957843
    starting-at-height-23537757; 13359353
    starting-at-height-24062757; 12786526
    starting-at-height-24587757; 12238261
    starting-at-height-25112757; 11713504
    starting-at-height-25637757; 11211248
    starting-at-height-26162757; 10730528
    starting-at-height-26687757; 10270420
    starting-at-height-27212757; 9830041
    starting-at-height-27737757; 9408545
    starting-at-height-28262757; 9005122
    starting-at-height-28787757; 8618997
    starting-at-height-29312757; 8249428
    starting-at-height-29837757; 7895707
    starting-at-height-30362757; 7557151
    starting-at-height-30887757; 7233113
    starting-at-height-31412757; 6922969
    starting-at-height-31937757; 6626123
    starting-at-height-32462757; 6342006
    starting-at-height-32987757; 6070071
    starting-at-height-33512757; 5809796
    starting-at-height-34037757; 5560682
    starting-at-height-34562757; 5322249
    starting-at-height-35087757; 5094039
    starting-at-height-35612757; 4875615
    starting-at-height-36137757; 4666557
    starting-at-height-36662757; 4466462
    starting-at-height-37187757; 4274948
    starting-at-height-37712757; 4091645
    starting-at-height-38237757; 3916202
    starting-at-height-38762757; 3748282
    starting-at-height-39287757; 3587561
    starting-at-height-39812757; 3433732
    starting-at-height-40337757; 3286500
    starting-at-height-40862757; 3145580
    starting-at-height-41387757; 3010703
    starting-at-height-41912757; 2881608
    starting-at-height-42437757; 2758050
    starting-at-height-42962757; 2639789
    starting-at-height-43487757; 2526599
    starting-at-height-44012757; 2418263
    starting-at-height-44537757; 2314572
    starting-at-height-45062757; 2215326
    starting-at-height-45587757; 2120337
    starting-at-height-46112757; 2029420
    starting-at-height-46637757; 1942402
    starting-at-height-47162757; 1859115
    starting-at-height-47687757; 1779399
    starting-at-height-48212757; 1703101
    starting-at-height-48737757; 1630075
    starting-at-height-49262757; 1560180
    starting-at-height-49787757; 1493282
    starting-at-height-50312757; 1429253
    starting-at-height-50837757; 1367969
    starting-at-height-51362757; 1309312
    starting-at-height-51887757; 1253171
    starting-at-height-52412757; 1199437
    starting-at-height-52937757; 1148007
    starting-at-height-53462757; 1098783
    starting-at-height-53987757; 1051669
    starting-at-height-54512757; 1006575
    starting-at-height-55037757; 963414
    starting-at-height-55562757; 922105
    starting-at-height-56087757; 882566
    starting-at-height-56612757; 844723
    starting-at-height-57137757; 808503
    starting-at-height-57662757; 773836
    starting-at-height-58187757; 740655
    starting-at-height-58712757; 708897
    starting-at-height-59237757; 678500
    starting-at-height-59762757; 649407
    starting-at-height-60287757; 621562
    starting-at-height-60812757; 594910
    starting-at-height-61337757; 569401
    starting-at-height-61862757; 544986
    starting-at-height-62387757; 521618
    starting-at-height-62912757; 499252
    starting-at-height-63437757; 477845
    starting-at-height-63962757; 457356
    starting-at-height-64487757; 437745
    starting-at-height-65012757; 418975
    starting-at-height-65537757; 401010
    starting-at-height-66062757; 383816
    starting-at-height-66587757; 367358
    starting-at-height-67112757; 351606
    starting-at-height-67637757; 336530
    starting-at-height-68162757; 322100
    starting-at-height-68687757; 308289
    starting-at-height-69212757; 295070
    starting-at-height-69737757; 282418
    starting-at-height-70262757; 270308
    starting-at-height-70787757; 258718
    starting-at-height-71312757; 247624
    starting-at-height-71837757; 237007
    starting-at-height-72362757; 226844
    starting-at-height-72887757; 217118
    starting-at-height-73412757; 207808
    starting-at-height-73937757; 198897
    starting-at-height-74462757; 190369
    starting-at-height-74987757; 182206
    starting-at-height-75512757; 174394
    starting-at-height-76037757; 166916
    starting-at-height-76562757; 159759
    starting-at-height-77087757; 152908
    starting-at-height-77612757; 146352
    starting-at-height-78137757; 140077
    starting-at-height-78662757; 134070
    starting-at-height-79187757; 128322
    starting-at-height-79712757; 122819
    starting-at-height-80237757; 117553
    starting-at-height-80762757; 112513
    starting-at-height-81287757; 107688
    starting-at-height-81812757; 103071
    starting-at-height-82337757; 98651
    starting-at-height-82862757; 94421
    starting-at-height-83387757; 90372
    starting-at-height-83912757; 86497
    starting-at-height-84437757; 82789
    starting-at-height-84962757; 79239
    starting-at-height-85487757; 75841
    starting-at-height-86012757; 72589
    starting-at-height-86537757; 69477
    starting-at-height-87062757; 66498
    starting-at-height-87587757; 63646
    starting-at-height-88112757; 60917
    starting-at-height-88637757; 58305
    starting-at-height-89162757; 55805
    starting-at-height-89687757; 53412
    starting-at-height-90212757; 51122
    starting-at-height-90737757; 48930
    starting-at-height-91262757; 46832
    starting-at-height-91787757; 44824
    starting-at-height-92312757; 42902
    starting-at-height-92837757; 41062
    starting-at-height-93362757; 39301
    starting-at-height-93887757; 37616
    starting-at-height-94412757; 36003
    starting-at-height-94937757; 34460
    starting-at-height-95462757; 32982
    starting-at-height-95987757; 31568
    starting-at-height-96512757; 30214
    starting-at-height-97037757; 28919
    starting-at-height-97562757; 27679
    starting-at-height-98087757; 26492
    starting-at-height-98612757; 25356
    starting-at-height-99137757; 24269
    starting-at-height-99662757; 23228
    starting-at-height-100187757; 22232
    starting-at-height-100712757; 21279
    starting-at-height-101237757; 20366
    starting-at-height-101762757; 19493
    starting-at-height-102287757; 18657
    starting-at-height-102812757; 17857
    starting-at-height-103337757; 17091
    starting-at-height-103862757; 16358
    starting-at-height-104387757; 15657
    starting-at-height-104912757; 14986
    starting-at-height-105437757; 14343
    starting-at-height-105962757; 13728
    starting-at-height-106487757; 13139
    starting-at-height-107012757; 12576
    starting-at-height-107537757; 12037
    starting-at-height-108062757; 11521
    starting-at-height-108587757; 11027
    starting-at-height-109112757; 10554
    starting-at-height-109637757; 10101
    starting-at-height-110162757; 9668
    starting-at-height-110687757; 9254
    starting-at-height-111212757; 8857
    starting-at-height-111737757; 8477
    starting-at-height-112262757; 8113
    starting-at-height-112787757; 7766
    starting-at-height-113312757; 7433
    starting-at-height-113837757; 7114
    starting-at-height-114362757; 6809
    starting-at-height-114887757; 6517
    starting-at-height-115412757; 6237
    starting-at-height-115937757; 5970
    starting-at-height-116462757; 5714
    starting-at-height-116987757; 5469
    starting-at-height-117512757; 5234
    starting-at-height-118037757; 5010
    starting-at-height-118562757; 4795
    starting-at-height-119087757; 4589
    starting-at-height-119612757; 4393
    starting-at-height-120137757; 4204
    starting-at-height-120662757; 4024
    starting-at-height-121187757; 3851
    starting-at-height-121712757; 3686
    starting-at-height-122237757; 3528
    starting-at-height-122762757; 3377
    starting-at-height-123287757; 3232
    starting-at-height-123812757; 3093
    starting-at-height-124337757; 2961
    starting-at-height-124862757; 2834
    starting-at-height-125387757; 2712
    starting-at-height-125912757; 2596
    starting-at-height-126437757; 2485
    starting-at-height-126962757; 2378
    starting-at-height-127487757; 2276
    starting-at-height-128012757; 2178
    starting-at-height-128537757; 2085
    starting-at-height-129062757; 1996
    starting-at-height-129587757; 1910
    starting-at-height-130112757; 1828
    starting-at-height-130637757; 1750
    starting-at-height-131162757; 1675
    starting-at-height-131687757; 1603
    starting-at-height-132212757; 1534
    starting-at-height-132737757; 1468
    starting-at-height-133262757; 1405
    starting-at-height-133787757; 1345
    starting-at-height-134312757; 1287
    starting-at-height-134837757; 1232
    starting-at-height-135362757; 1179
    starting-at-height-135887757; 1129
    starting-at-height-136412757; 1080
    starting-at-height-136937757; 1034
    starting-at-height-137462757; 990
    starting-at-height-137987757; 947
    starting-at-height-138512757; 907
    starting-at-height-139037757; 868
    starting-at-height-139562757; 830
    starting-at-height-140087757; 795
    starting-at-height-140612757; 761
    starting-at-height-141137757; 728
    starting-at-height-141662757; 697
    starting-at-height-142187757; 667
    starting-at-height-142712757; 638
    starting-at-height-143237757; 611
    starting-at-height-143762757; 585
    starting-at-height-144287757; 560
    starting-at-height-144812757; 536
    starting-at-height-145337757; 513
    starting-at-height-145862757; 491
    starting-at-height-146387757; 470
    starting-at-height-146912757; 449
    starting-at-height-147437757; 430
    starting-at-height-147962757; 412
    starting-at-height-148487757; 394
    starting-at-height-149012757; 377
    starting-at-height-149537757; 361
    starting-at-height-150062757; 345
    starting-at-height-150587757; 331
    starting-at-height-151112757; 316
    starting-at-height-151637757; 303
    starting-at-height-152162757; 290
    starting-at-height-152687757; 277
    starting-at-height-153212757; 265
    starting-at-height-153737757; 254
    starting-at-height-154262757; 243
    starting-at-height-154787757; 233
    starting-at-height-155312757; 223
    starting-at-height-155837757; 213
    starting-at-height-156362757; 204
    starting-at-height-156887757; 195
    starting-at-height-157412757; 187
    starting-at-height-157937757; 179
    starting-at-height-158462757; 171
    starting-at-height-158987757; 164
    starting-at-height-159512757; 157
    starting-at-height-160037757; 150
    starting-at-height-160562757; 143
    starting-at-height-161087757; 137
    starting-at-height-161612757; 131
    starting-at-height-162137757; 126
    starting-at-height-162662757; 120
    starting-at-height-163187757; 115
    starting-at-height-163712757; 110
    starting-at-height-164237757; 105
    starting-at-height-164762757; 101
    starting-at-height-165287757; 97
    starting-at-height-165812757; 92
    starting-at-height-166337757; 88
    starting-at-height-166862757; 85
    starting-at-height-167387757; 81
    starting-at-height-167912757; 77
    starting-at-height-168437757; 74
    starting-at-height-168962757; 71
    starting-at-height-169487757; 68
    starting-at-height-170012757; 65
    starting-at-height-170537757; 62
    starting-at-height-171062757; 59
    starting-at-height-171587757; 57
    starting-at-height-172112757; 54
    starting-at-height-172637757; 52
    starting-at-height-173162757; 50
    starting-at-height-173687757; 48
    starting-at-height-174212757; 46
    starting-at-height-174737757; 44
    starting-at-height-175262757; 42
    starting-at-height-175787757; 40
    starting-at-height-176312757; 38
    starting-at-height-176837757; 37
    starting-at-height-177362757; 35
    starting-at-height-177887757; 33
    starting-at-height-178412757; 32
    starting-at-height-178937757; 31
    starting-at-height-179462757; 29
    starting-at-height-179987757; 28
    starting-at-height-180512757; 27
    starting-at-height-181037757; 26
    starting-at-height-181562757; 24
    starting-at-height-182087757; 23
    starting-at-height-182612757; 22
    starting-at-height-183137757; 21
    starting-at-height-183662757; 20
    starting-at-height-184187757; 20
    starting-at-height-184712757; 19
    starting-at-height-185237757; 18
    starting-at-height-185762757; 17
    starting-at-height-186287757; 16
    starting-at-height-186812757; 16
    starting-at-height-187337757; 15
    starting-at-height-187862757; 14
    starting-at-height-188387757; 14
    starting-at-height-188912757; 13
    starting-at-height-189437757; 12
    starting-at-height-189962757; 12
    starting-at-height-190487757; 11
    starting-at-height-191012757; 11
    starting-at-height-191537757; 10
    starting-at-height-192062757; 10
    starting-at-height-192587757; 9
    starting-at-height-193112757; 9
    starting-at-height-193637757; 9
    starting-at-height-194162757; 8
    starting-at-height-194687757; 8
    starting-at-height-195212757; 8
    starting-at-height-195737757; 7
    starting-at-height-196262757; 7
    starting-at-height-196787757; 7
    starting-at-height-197312757; 6
    starting-at-height-197837757; 6
    starting-at-height-198362757; 6
    starting-at-height-198887757; 5
    starting-at-height-199412757; 5
    starting-at-height-199937757; 5
    starting-at-height-200462757; 5
    starting-at-height-200987757; 4
    starting-at-height-201512757; 4
    starting-at-height-202037757; 4
    starting-at-height-202562757; 4
    starting-at-height-203087757; 4
    starting-at-height-203612757; 4
    starting-at-height-204137757; 3
    starting-at-height-204662757; 3
    starting-at-height-205187757; 3
    starting-at-height-205712757; 3
    starting-at-height-206237757; 3
    starting-at-height-206762757; 3
    starting-at-height-207287757; 2
    starting-at-height-207812757; 2
    starting-at-height-208337757; 2
    starting-at-height-208862757; 2
    starting-at-height-209387757; 2
    starting-at-height-209912757; 2
    starting-at-height-210437757; 2
    starting-at-height-210962757; 2
    starting-at-height-211487757; 2
    starting-at-height-212012757; 2
    starting-at-height-212537757; 1
    starting-at-height-213062757; 1
    starting-at-height-213587757; 1
    starting-at-height-214112757; 1
    starting-at-height-214637757; 1
    starting-at-height-215162757; 1
    starting-at-height-215687757; 1
    starting-at-height-216212757; 1
    starting-at-height-216737757; 1
    starting-at-height-217262757; 1
    starting-at-height-217787757; 1
    starting-at-height-218312757; 1
    starting-at-height-218837757; 1
    starting-at-height-219362757; 1
    starting-at-height-219887757; 1
    starting-at-height-220412757; 1
    starting-at-height-220937757; 0

config-logging-broker.properties
================================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **console**;
    sinkType; Async
    level; Info
    colorMode; Ansi
    **console.component.levels**;
    **file**;
    sinkType; Async
    level; Info
    directory; logs
    filePattern; logs/catapult_broker%4N.log
    rotationSize; 25MB
    maxTotalSize; 1000MB
    minFreeSpace; 100MB
    **file.component.levels**;

config-logging-recovery.properties
==================================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **console**;
    sinkType; Sync
    level; Info
    colorMode; Ansi
    **console.component.levels**;
    **file**;
    sinkType; Async
    level; Info
    directory; logs
    filePattern; logs/catapult_recovery%4N.log
    rotationSize; 25MB
    maxTotalSize; 1000MB
    minFreeSpace; 100MB
    **file.component.levels**;

config-logging-server.properties
================================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **console**;
    sinkType; Sync
    level; Info
    colorMode; Ansi
    **console.component.levels**;
    **file**;
    sinkType; Sync
    level; Info
    directory; logs
    filePattern; logs/catapult_server%4N.log
    rotationSize; 25MB
    maxTotalSize; 1000MB
    minFreeSpace; 100MB
    **file.component.levels**;

config-messaging.properties
===========================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **messaging**;
    subscriberPort; 7902
    listenInterface; 0.0.0.0

config-network.properties
=========================
.. csv-table::
    :header: "Property", "Value", "Type", "Description"
    :delim: ;

    **network**; ; ;
    identifier; public-test; NetworkIdentifier; Network identifier.
    nemesisSignerPublicKey; 071964D3C040D62DE905EAE978E2119BFC8E70489BFDF45A85B3D7ED5A517AA8; Key; Nemesis public key.
    nodeEqualityStrategy; host; NodeIdentityEqualityStrategy; Node equality strategy.
    generationHashSeed; 45FBCF2F0EA36EFA7923C9BC923D6503169651F7FA4EFC46A8EAF5AE09057EBD; ;
    epochAdjustment; 1573430400s; utils::TimeSpan; Nemesis epoch time adjustment.
    **chain**; ; ;
    enableVerifiableState; true; bool; Set to true if block chain should calculate state hashes so that state is fully verifiable at each block.
    enableVerifiableReceipts; true; bool; Set to true if block chain should calculate receipts so that state changes are fully verifiable at each block.
    currencyMosaicId; 0x2CF4'03E8'5507'F39E; MosaicId; Mosaic id used as primary chain currency.
    harvestingMosaicId; 0x2CF4'03E8'5507'F39E; MosaicId; Mosaic id used to provide harvesting ability.
    blockGenerationTargetTime; 30s; utils::TimeSpan; Targeted time between blocks.
    blockTimeSmoothingFactor; 3000; uint32_t; Note: A higher value makes the network more biased. Note: This can lower security because it will increase the influence of time relative to importance.
    importanceGrouping; 180; uint64_t; Number of blocks that should be treated as a group for importance purposes. Note: Importances will only be calculated at blocks that are multiples of this grouping number.
    importanceActivityPercentage; 5; uint8_t; Percentage of importance resulting from fee generation and beneficiary usage.
    maxRollbackBlocks; 0; uint32_t; Maximum number of blocks that can be rolled back.
    maxDifficultyBlocks; 60; uint32_t; Maximum number of blocks to use in a difficulty calculation.
    defaultDynamicFeeMultiplier; 1'000; BlockFeeMultiplier; Default multiplier to use for dynamic fees.
    maxTransactionLifetime; 6h; utils::TimeSpan; Maximum lifetime a transaction can have before it expires.
    maxBlockFutureTime; 500ms; utils::TimeSpan; Maximum future time of a block that can be accepted.
    initialCurrencyAtomicUnits; 7'831'975'436'000'000; Amount; Initial currency atomic units available in the network.
    maxMosaicAtomicUnits; 9'000'000'000'000'000; Amount; Maximum atomic units (total-supply * 10 ^ divisibility) of a mosaic allowed in the network.
    totalChainImportance; 7'831'975'436'000'000; Importance; Total whole importance units available in the network.
    minHarvesterBalance; 10'000'000'000; Amount; Minimum number of harvesting mosaic atomic units needed for an account to be eligible for harvesting.
    maxHarvesterBalance; 50'000'000'000'000; Amount; Maximum number of harvesting mosaic atomic units needed for an account to be eligible for harvesting.
    minVoterBalance; 3'000'000'000'000; Amount; Minimum number of harvesting mosaic atomic units needed for an account to be eligible for voting.
    votingSetGrouping; 720; ;
    maxVotingKeysPerAccount; 3; uint8_t; Maximum number of voting keys that can be registered at once per account.
    minVotingKeyLifetime; 28; uint32_t; Minimum number of finalization rounds for which voting key can be registered.
    maxVotingKeyLifetime; 26280; uint32_t; Maximum number of finalization rounds for which voting key can be registered.
    harvestBeneficiaryPercentage; 25; uint8_t; Percentage of the harvested fee that is collected by the beneficiary account.
    harvestNetworkPercentage; 5; uint8_t; Percentage of the harvested fee that is collected by the network.
    harvestNetworkFeeSinkAddress; TDGY4DD2U4YQQGERFMDQYHPYS6M7LHIF6XUCJ4Q; Address; Address of the harvest network fee sink account.
    maxTransactionsPerBlock; 6'000; uint32_t; Maximum number of transactions per block.
    **plugin:catapult.plugins.accountlink**;
    dummy; to trigger plugin load
    **plugin:catapult.plugins.aggregate**; ; ;
    maxTransactionsPerAggregate; 100; uint32_t; Maximum number of transactions per aggregate.
    maxCosignaturesPerAggregate; 25; uint8_t; Maximum number of cosignatures per aggregate.
    enableStrictCosignatureCheck; false; bool; Set to true if cosignatures must exactly match component signers. Set to false if cosignatures should be validated externally.
    enableBondedAggregateSupport; true; bool; Set to true if bonded aggregates should be allowed. Set to false if bonded aggregates should be rejected.
    maxBondedTransactionLifetime; 48h; utils::TimeSpan; Maximum lifetime a bonded transaction can have before it expires.
    **plugin:catapult.plugins.lockhash**; ; ;
    lockedFundsPerAggregate; 10'000'000; Amount; Amount that has to be locked per aggregate in partial cache.
    maxHashLockDuration; 2d; utils::BlockSpan; Maximum number of blocks for which a hash lock can exist.
    **plugin:catapult.plugins.locksecret**; ; ;
    maxSecretLockDuration; 365d; utils::BlockSpan; Maximum number of blocks for which a secret lock can exist.
    minProofSize; 20; uint16_t; Minimum size of a proof in bytes.
    maxProofSize; 1024; uint16_t; Maximum size of a proof in bytes.
    **plugin:catapult.plugins.metadata**; ; ;
    maxValueSize; 1024; uint16_t; Maximum metadata value size.
    **plugin:catapult.plugins.mosaic**; ; ;
    maxMosaicsPerAccount; 1'000; uint16_t; Maximum number of mosaics that an account can own.
    maxMosaicDuration; 3650d; utils::BlockSpan; Maximum mosaic duration.
    maxMosaicDivisibility; 6; uint8_t; Maximum mosaic divisibility.
    mosaicRentalFeeSinkAddress; TDGY4DD2U4YQQGERFMDQYHPYS6M7LHIF6XUCJ4Q; Address; Address of the mosaic rental fee sink account.
    mosaicRentalFee; 500; Amount; Mosaic rental fee.
    **plugin:catapult.plugins.multisig**; ; ;
    maxMultisigDepth; 3; uint8_t; Maximum number of multisig levels.
    maxCosignatoriesPerAccount; 25; uint32_t; Maximum number of cosignatories per account.
    maxCosignedAccountsPerAccount; 25; uint32_t; Maximum number of accounts a single account can cosign.
    **plugin:catapult.plugins.namespace**; ; ;
    maxNameSize; 64; uint8_t; Maximum namespace name size.
    maxChildNamespaces; 256; uint16_t; Maximum number of children for a root namespace.
    maxNamespaceDepth; 3; uint8_t; Maximum namespace depth.
    minNamespaceDuration; 30d; utils::BlockSpan; Minimum namespace duration.
    maxNamespaceDuration; 1825d; utils::BlockSpan; Maximum namespace duration.
    namespaceGracePeriodDuration; 1d; utils::BlockSpan; Grace period during which time only the previous owner can renew an expired namespace.
    reservedRootNamespaceNames; symbol, symbl, xym, xem, nem, user, account, org, com, biz, net, edu, mil, gov, info; unordered_set<string>; Reserved root namespaces that cannot be claimed.
    namespaceRentalFeeSinkAddress; TDGY4DD2U4YQQGERFMDQYHPYS6M7LHIF6XUCJ4Q; Address; Address of the namespace rental fee sink account.
    rootNamespaceRentalFeePerBlock; 1; Amount; Root namespace rental fee per block.
    childNamespaceRentalFee; 100; Amount; Child namespace rental fee.
    **plugin:catapult.plugins.restrictionaccount**; ; ;
    maxAccountRestrictionValues; 512; uint16_t; Maximum number of account restriction values.
    **plugin:catapult.plugins.restrictionmosaic**; ; ;
    maxMosaicRestrictionValues; 20; uint8_t; Maximum number of mosaic restriction values.
    **plugin:catapult.plugins.transfer**; ; ;
    maxMessageSize; 1024; uint16_t; Maximum transaction message size.

config-node.properties
======================
.. csv-table::
    :header: "Property", "Value", "Type", "Description"
    :delim: ;

    **node**; ; ;
    port; 7900; unsigned short; Server port.
    maxIncomingConnectionsPerIdentity; 6; uint32_t; Maximum number of incoming connections per identity over primary port.
    enableAddressReuse; false; bool; Set to true if the server should reuse ports already in use.
    enableSingleThreadPool; true; bool; Set to true if a single thread pool should be used, Set to false if multiple thread pools should be used.
    enableCacheDatabaseStorage; true; bool; Set to true if cache data should be saved in a database.
    enableAutoSyncCleanup; true; bool; Set to true if temporary sync files should be automatically cleaned up. Note: This should be Set to false if broker process is running.
    fileDatabaseBatchSize; 1; ;
    enableTransactionSpamThrottling; true; bool; Set to true if transaction spam throttling should be enabled.
    transactionSpamThrottlingMaxBoostFee; 10'000'000; Amount; Maximum fee that will boost a transaction through the spam throttle when spam throttling is enabled.
    maxHashesPerSyncAttempt; 370; ;
    maxBlocksPerSyncAttempt; 360; uint32_t; Maximum number of blocks per sync attempt.
    maxChainBytesPerSyncAttempt; 100MB; utils::FileSize; Maximum chain bytes per sync attempt.
    shortLivedCacheTransactionDuration; 10m; utils::TimeSpan; Duration of a transaction in the short lived cache.
    shortLivedCacheBlockDuration; 100m; utils::TimeSpan; Duration of a block in the short lived cache.
    shortLivedCachePruneInterval; 90s; utils::TimeSpan; Time between short lived cache pruning.
    shortLivedCacheMaxSize; 10'000'000; uint32_t; Maximum size of a short lived cache.
    minFeeMultiplier; 100; BlockFeeMultiplier; Minimum fee multiplier of transactions to propagate and include in blocks.
    maxTimeBehindPullTransactionsStart; 5m; ;
    transactionSelectionStrategy; oldest; model::TransactionSelectionStrategy; Transaction selection strategy used for syncing and harvesting unconfirmed transactions.
    unconfirmedTransactionsCacheMaxResponseSize; 5MB; utils::FileSize; Maximum size of an unconfirmed transactions response.
    unconfirmedTransactionsCacheMaxSize; 20MB; uint32_t; Maximum size of the unconfirmed transactions cache.
    connectTimeout; 15s; utils::TimeSpan; Timeout for connecting to a peer.
    syncTimeout; 20m; utils::TimeSpan; Timeout for syncing with a peer.
    socketWorkingBufferSize; 16KB; utils::FileSize; Initial socket working buffer size (socket reads will attempt to read buffers of roughly this size).
    socketWorkingBufferSensitivity; 1; uint32_t; Socket working buffer sensitivity (lower values will cause memory to be more aggressively reclaimed). Note: Set to 0 will disable memory reclamation.
    maxPacketDataSize; 150MB; utils::FileSize; Maximum packet data size.
    blockDisruptorSlotCount; 4096; uint32_t; Size of the block disruptor circular buffer.
    blockElementTraceInterval; 1; uint32_t; Multiple of elements at which a block element should be traced through queue and completion.
    blockDisruptorMaxMemorySize; 300MB; ;
    transactionDisruptorSlotCount; 8192; uint32_t; Size of the transaction disruptor circular buffer.
    transactionElementTraceInterval; 10; uint32_t; Multiple of elements at which a transaction element should be traced through queue and completion.
    transactionDisruptorMaxMemorySize; 20MB; ;
    enableDispatcherAbortWhenFull; false; bool; Set to true if the process should terminate when any dispatcher is full.
    enableDispatcherInputAuditing; false; bool; Set to true if all dispatcher inputs should be audited.
    maxTrackedNodes; 5'000; uint32_t; Maximum number of nodes to track in memory.
    minPartnerNodeVersion; 0.10.0.7; ;
    maxPartnerNodeVersion; 0.10.1.8; ;
    trustedHosts; ; unordered_set<string>; Trusted hosts that are allowed to execute protected API calls on this node.
    localNetworks; 127.0.0.1; unordered_set<string>; Networks that should be treated as local.
    listenInterface; 0.0.0.0; ;
    **cache_database**;
    enableStatistics; false
    maxOpenFiles; 0
    maxBackgroundThreads; 0
    maxSubcompactionThreads; 0
    blockCacheSize; 0MB
    memtableMemoryBudget; 0MB
    maxWriteBatchSize; 5MB
    **localnode**; ; ;
    host; ; string; Node host (leave empty to auto-detect IP).
    friendlyName; myFriendlyName; string; Node friendly name (leave empty to use address).
    version; 0.10.1.8; uint32_t; Node version.
    roles; Peer,Voting; ionet::NodeRoles; Node roles.
    **outgoing_connections**; ; ;
    maxConnections; 10; uint16_t; Maximum number of active connections.
    maxConnectionAge; 200; uint16_t; Maximum connection age.
    maxConnectionBanAge; 20; uint16_t; Maximum connection ban age.
    numConsecutiveFailuresBeforeBanning; 3; uint16_t; Number of consecutive connection failures before a connection is banned.
    **incoming_connections**; ; ;
    maxConnections; 512; uint16_t; Maximum number of active connections.
    maxConnectionAge; 200; uint16_t; Maximum connection age.
    maxConnectionBanAge; 20; uint16_t; Maximum connection ban age.
    numConsecutiveFailuresBeforeBanning; 3; uint16_t; Number of consecutive connection failures before a connection is banned.
    backlogSize; 512; uint16_t; Maximum size of the pending connections queue.
    **banning**; ; ;
    defaultBanDuration; 12h; utils::TimeSpan; Default duration for banning.
    maxBanDuration; 12h; utils::TimeSpan; Maximum duration for banning.
    keepAliveDuration; 48h; utils::TimeSpan; Duration to keep account in container after the ban expired.
    maxBannedNodes; 5'000; uint32_t; Maximum number of banned nodes.
    numReadRateMonitoringBuckets; 4; uint16_t; Number of read rate monitoring buckets (Set to 0 to disable read rate monitoring).
    readRateMonitoringBucketDuration; 15s; utils::TimeSpan; Duration of each read rate monitoring bucket.
    maxReadRateMonitoringTotalSize; 100MB; utils::FileSize; Maximum size allowed during full read rate monitoring period.
    minTransactionFailuresCountForBan; 8; ;
    minTransactionFailuresPercentForBan; 10; ;

config-pt.properties
====================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **partialtransactions**;
    cacheMaxResponseSize; 5MB
    cacheMaxSize; 20MB

config-task.properties
======================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **logging task**;
    startDelay; 1m
    repeatDelay; 10m
    **connect peers task for service Finalization**;
    startDelay; 2s
    repeatDelay; 1m
    **finalization task**;
    startDelay; 2m
    repeatDelay; 15s
    **pull finalization messages task**;
    startDelay; 3s
    repeatDelay; 1s
    **pull finalization proof task**;
    startDelay; 10s
    repeatDelay; 50s
    **harvesting task**;
    startDelay; 30s
    repeatDelay; 1s
    **network chain height detection**;
    startDelay; 1s
    repeatDelay; 15s
    **node discovery peers task**;
    startDelay; 1m
    minDelay; 1m
    maxDelay; 10m
    numPhaseOneRounds; 10
    numTransitionRounds; 20
    **node discovery ping task**;
    startDelay; 2m
    repeatDelay; 5m
    **age peers task for service Readers**;
    startDelay; 1m
    repeatDelay; 1m
    **batch partial transaction task**;
    startDelay; 500ms
    repeatDelay; 500ms
    **connect peers task for service Pt**;
    startDelay; 3s
    repeatDelay; 1m
    **pull partial transactions task**;
    startDelay; 10s
    repeatDelay; 3s
    **batch transaction task**;
    startDelay; 500ms
    repeatDelay; 500ms
    **connect peers task for service Sync**;
    startDelay; 1s
    repeatDelay; 1m
    **pull unconfirmed transactions task**;
    startDelay; 4s
    repeatDelay; 3s
    **synchronizer task**;
    startDelay; 3s
    repeatDelay; 3s
    **time synchronization task**;
    startDelay; 1m
    minDelay; 3m
    maxDelay; 180m
    numPhaseOneRounds; 5
    numTransitionRounds; 10
    **static node refresh task**;
    startDelay; 5ms
    minDelay; 15s
    maxDelay; 24h
    numPhaseOneRounds; 20
    numTransitionRounds; 20

config-timesync.properties
==========================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **timesynchronization**;
    maxNodes; 20
    minImportance; 3'750

config-user.properties
======================
.. csv-table::
    :header: "Property", "Value"
    :delim: ;

    **account**;
    enableDelegatedHarvestersAutoDetection; true
    **storage**;
    seedDirectory; ./seed
    certificateDirectory; ./cert
    dataDirectory; ./data
    pluginsDirectory; /usr/catapult/lib
    votingKeysDirectory; ./votingkeys
