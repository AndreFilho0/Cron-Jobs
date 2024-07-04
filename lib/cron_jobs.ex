defmodule CronJobs do
  use GenServer
  alias HTTPoison


  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  @impl true
  def init(stack) do
    schedule_request()
    {:ok, stack}
  end
  @impl true
  def handle_info(:request_task, state) do
    IO.puts("Requisição antes de enviar")
    send_request()
    IO.puts("Requisição enviada!")
    schedule_request()
    {:noreply, state}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end



  defp schedule_request do
    Process.send_after(self(), :request_task, 10000) 
  end

   def pop do
    GenServer.call(CronJobs, :pop)
   end
   def push (valor) do
     GenServer.cast(CronJobs,{:push,valor})
   end
  defp send_request do
    url = "https://dummyjson.com/user/2"
    headers = [{"Content-Type", "application/json"}]

    case HTTPoison.get(url,headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts("Requisição enviada com sucesso: #{body}")
        push(body)
      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        IO.puts("Requisição retornou código HTTP #{code}: #{body}")
        push(body)
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Erro ao enviar requisição: #{reason}")
        push(reason)
      _ ->
        IO.puts("Erro desconhecido ao enviar requisição")
        push("Erro desconhecido ao enviar requisição")
    end
  end
end
