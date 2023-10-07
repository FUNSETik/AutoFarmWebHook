local codes = {
}

for i , v in pairs(codes) do
    game:GetService("ReplicatedStorage").endpoints.client_to_server.redeem_code:InvokeServer(v)
    wait()
end

local A_1 = "EventClover"
local A_2 = "ticket" --ticket, gems10
local Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["buy_from_banner"]

local A_12 = "EventClover"
local A_22 = "gems10" --ticket, gems10
local Event2 = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["buy_from_banner"]

local A_13 = "EventClover"
local A_23 = "gems" --ticket, gems10
local Event3 = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["buy_from_banner"]

while wait(1) do
    Event:InvokeServer(A_1, A_2)
    if game.Players.LocalPlayer._stats.gem_amount.Value >= 500 then
        Event2:InvokeServer(A_12, A_22)
    elseif game.Players.LocalPlayer._stats.gem_amount.Value >= 50 then
        Event3:InvokeServer(A_13, A_23)
    end
end
