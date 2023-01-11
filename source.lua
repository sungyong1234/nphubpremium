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
		Text = "NP Hub를 로딩하는 중입니다.\n\n디스코드 커뮤니티에 참가해주세요.",
		Button1 = "Join Discord!",
		Callback = NotificationBindable
	}
)

loadstring(game:HttpGet("https://raw.githubusercontent.com/sungyong1234/nphubpremium/main/main.lua"))();
