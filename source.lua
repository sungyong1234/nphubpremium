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
		Title = "NP Hub",
		Duration = 5,
		Text = "Loading lastest version!\n\nJoin our Discord for games, scripts and more",
		Button1 = "Join Discord!",
		Callback = NotificationBindable
	}
)

loadstring(game:HttpGet("https://raw.githubusercontent.com/sungyong1234/nphubpremium/main/main.lua"))();
