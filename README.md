# CronJobs

**TODO: Add description**

# Projeto pessoal para realizar chamadas periódicos para uma api ( 10 em 10 segundos) , salvando os possíveis valores de resposta em uma pilha

# Usando um supervisor para voltar o processo CronJobs caso ocorre erros 

# Erro deixado para testar o Supervisor: 
(quando é tirado tdos os valores da pilha o processo morre)
```
iex(1)> CronJobs.start_link([:init])
{:ok, #PID<0.215.0>}
iex(2)> CronJobs.p                  
pop/0     push/1    
iex(2)> CronJobs.pop
:init
iex(3)> CronJobs.pop

21:20:51.211 [error] GenServer CronJobs terminating
** (FunctionClauseError) no function clause matching in CronJobs.handle_call/3
    (cron_jobs 0.1.0) lib/cron_jobs.ex:25: CronJobs.handle_call(:pop, {#PID<0.214.0>, [:alias | #Reference<0.1792952194.3241476097.224167>]}, [])
    (stdlib 4.3.1.4) gen_server.erl:1149: :gen_server.try_handle_call/4
    (stdlib 4.3.1.4) gen_server.erl:1178: :gen_server.handle_msg/6
    (stdlib 4.3.1.4) proc_lib.erl:240: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.214.0>): :pop
State: []
Client #PID<0.214.0> is alive

    (stdlib 4.3.1.4) gen.erl:256: :gen.do_call/4
    (elixir 1.17.0-rc.1) lib/gen_server.ex:1125: GenServer.call/3
    (elixir 1.17.0-rc.1) src/elixir.erl:386: :elixir.eval_external_handler/3
    (stdlib 4.3.1.4) erl_eval.erl:748: :erl_eval.do_apply/7
    (elixir 1.17.0-rc.1) src/elixir.erl:364: :elixir.eval_forms/4
    (elixir 1.17.0-rc.1) lib/module/parallel_checker.ex:112: Module.ParallelChecker.verify/1
    (iex 1.17.0-rc.1) lib/iex/evaluator.ex:332: IEx.Evaluator.eval_and_inspect/3
    (iex 1.17.0-rc.1) lib/iex/evaluator.ex:306: IEx.Evaluator.eval_and_inspect_parsed/3
** (EXIT from #PID<0.214.0>) shell process exited with reason: an exception was raised:
    ** (FunctionClauseError) no function clause matching in CronJobs.handle_call/3
        (cron_jobs 0.1.0) lib/cron_jobs.ex:25: CronJobs.handle_call(:pop, {#PID<0.214.0>, [:alias | #Reference<0.1792952194.3241476097.224167>]}, [])
        (stdlib 4.3.1.4) gen_server.erl:1149: :gen_server.try_handle_call/4
        (stdlib 4.3.1.4) gen_server.erl:1178: :gen_server.handle_msg/6
        (stdlib 4.3.1.4) proc_lib.erl:240: :proc_lib.init_p_do_apply/3

```





