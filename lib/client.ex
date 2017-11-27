defmodule Client do
    use GenServer
    def start_link(x,clients,servernode,acts) do
        input_srt = Integer.to_string(x)
        GenServer.start_link(__MODULE__, {x,servernode,acts}, name: String.to_atom("user#{x}"))    
    end

    def init({x,servernode,acts}) do        
       # register self
        {:ok, {x,acts,servernode}}
    end

    def handle_cast({:register},{x,acts,servernode})do
        #Send register request to server
        GenServer.call({:server,servernode},{:registeruser,x})
        GenServer.cast(:orc, {:registered})
        {:noreply,{x,acts,servernode}}
    end
    def handle_cast({:activate, subscribe_to},{x,acts,servernode})do
        #Subcribe to users
        #IO.puts "Client #{x} asked to activated, sub list = #{subscribe_to}"
        GenServer.cast({:server,servernode},{:subscribe,x,subscribe_to})
        #Randomly start tweeting/retweeting/subscribe/querying activities acc to zipf rank
        GenServer.cast(self,{:pick_random,1})
        {:noreply,{x,acts,servernode}}
    end

    def handle_cast({:pick_random,current_state},{x,acts,servernode}) do
        if(current_state ==  acts) do
            GenServer.cast(:orc, {:acts_completed})
        else
            choice = rem(round(:rand.uniform()*100000),5)
             case choice do
                 1 -> subscribe(x,servernode)

                 2 -> tweet(x,servernode)

                 3 ->"three"

                 4 ->"four"

                 5 ->"five"

                 _ -> 

             end
            GenServer.cast(self(),{:pick_random,current_state + 1})
        end
        {:noreply,{x,acts,servernode}}  
    end
    def handle_cast({:deactivate},{x,acts,servernode})do
        #stop all activities, play dead
        #inform server
        {:noreply,{x,acts,servernode}}
    end
    def handle_cast({:incoming_tweet,source,msg},{x,acts,servernode})do
        IO.puts "user#{x} received a tweet from user#{source}:: #{msg}"
        {:noreply,{x,acts,servernode}}
    end

    def tweet(x,servernode) do
        #Generate a message
        msg = "160 random characters"
        GenServer.cast({:server,servernode},{:tweet,x,msg})
    end
    def subscribe(x,servernode) do
        #Pick random user
        follow = :rand.uniform(x)
        if follow != x do
            GenServer.cast({:server,servernode},{:subscribe,x,[follow]})
        end
    end
    def query() do
        
    end
    
end