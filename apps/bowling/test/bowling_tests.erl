-module(bowling_tests).
-include_lib("eunit/include/eunit.hrl").

bowling_scores_test()->
    Result = bowling_app:calc("11"),
    ?assertEqual(2,Result),
    Result2 = bowling_app:calc("-1"),
    ?assertEqual(1,Result2),
    Result3 = bowling_app:calc("1-"),
    ?assertEqual(1,Result3),

    Result4 = bowling_app:calc("5/1-"),
    ?assertEqual(12,Result4),    
    Result5 = bowling_app:calc("X11"),
    ?assertEqual(14,Result5),
    Result6 = bowling_app:calc("XX--"),
    ?assertEqual(30,Result6),
    
    Result7 = bowling_app:calc("1/X--"),
    ?assertEqual(30,Result7),
    Result8 = bowling_app:calc("XXXXXXXXXX--"),
    ?assertEqual(270,Result8),
    Result9 = bowling_app:calc("9-9-9-9-9-9-9-9-9-9-"),
    ?assertEqual(90,Result9),
    Result10 = bowling_app:calc("5/5/5/5/5/5/5/5/5/5/0"),
    ?assertEqual(145,Result10),
    Result11 = bowling_app:calc("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX--"),
    ?assertEqual(900,Result11),
    Result12 =  bowling_app:calc("XX-1-"),
    ?assertEqual(32,Result12),
    Result13 =  bowling_app:calc("9/5/XX-1-"),
    ?assertEqual(67,Result13).

