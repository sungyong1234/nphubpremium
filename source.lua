local http = game:GetService('HttpService')
local req = (syn and syn.request) or (http and http.request) or http_request
if req then
req({
Url = 'http://127.0.0.1:6463/rpc?v=1',
Method = 'POST',
Headers = {
['Content-Type'] = 'application/json',
Origin = 'https://discord.com'
},
Body = http:JSONEncode({
cmd = 'INVITE_BROWSER',
nonce = http:GenerateGUID(false),
args = {code = 'nphubss'} -- 예시: https://discord.gg/rBDBDSkYzB <-- 이 초대링크에서 rBDBDSkYzB 이것만 따로 넣기
})
})
end

game.Players.LocalPlayer:Kick("NP Hub V1은 서비스가 종료되었습니다.")
