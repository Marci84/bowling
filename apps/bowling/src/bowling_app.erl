%%%-------------------------------------------------------------------
%% @doc bowling public API
%% @end
%%%-------------------------------------------------------------------

-module(bowling_app).

%% -behaviour(application).

%% Application callbacks
-export([calc/1]).

%%====================================================================
%% API
%%====================================================================

%% start(_StartType, _StartArgs) ->
%%     bowling_sup:start_link().

%%--------------------------------------------------------------------
%% stop(_State) ->
%%     ok.

%%====================================================================
%% Internal functions
%%====================================================================


calc(Score)->
    calc(Score,0).

calc([],Result)->
    Result;
calc([$X,N,N2|T],Result)->
    calc([N,N2|T],Result + 10 + calculate([N,N2]));
calc([_,$/,N2|T],Result)->
    calc([N2|T],Result + 10 + calculate(N2));
calc([N,N2|T],Result)->
    calc(T,Result + calculate(N) + calculate(N2));
calc([N],Result) ->
    Result + calculate(N).

calculate([N,N2])->
    First_value = case N of
                      $X ->
                          10;
                      $- ->
                          0;
                      N ->
                          list_to_integer([N])
                  end,        
    Second_value = case N2 of
                       $X ->
                           10;
                       $/ ->
                           10 - list_to_integer([N]);
                       $- ->
                           0;
                       N2 ->
                           list_to_integer([N2])
                   end,    
    First_value + Second_value;
calculate(N)->                       
    case N of 
        $X ->
            10;
        $- ->
            0;
        N ->
            list_to_integer([N])
    end.
