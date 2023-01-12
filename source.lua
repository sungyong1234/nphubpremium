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
		Text = "오늘도 NP Hub를 이용해주셔서 감사합니다. \n더좋은 서비스로 보답하겠습니다!\n오늘도 NP Hub를 로딩하는중입니다.",
		Button1 = "NP Hub Kakaotalk",
		Callback = NotificationBindable
	}
)

loadstring(game:HttpGet("https://raw.githubusercontent.com/sungyong1234/nphubpremium/main/main.lua"))();
