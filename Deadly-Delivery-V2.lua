-- SoundService 取得
local SoundService = game:GetService("SoundService")

-- 既に同名の Sound がある場合は再利用（重複作成防止）
local sound = SoundService:FindFirstChild("DeadlyDeliveryMusic")
if not sound then
    sound = Instance.new("Sound")
    sound.Name = "DeadlyDeliveryMusic"
    sound.Parent = SoundService
    sound.Volume = 0.1
end

-- ランダムの種を設定
if math.randomseed then
    math.randomseed(tick())
end

-- 再生したい音楽ID一覧（rbxassetid:// は必須）
-- https://robloxsong.com
local musicIds = {
    "rbxassetid://1837560230",
    "rbxassetid://1836009208",
    "rbxassetid://1835518944",
    "rbxassetid://115551995386269",
    "rbxassetid://1840513012",
    "rbxassetid://1836010756",
    "rbxassetid://1840364760",
    "rbxassetid://1848164519",
    "rbxassetid://7214835508",
    "rbxassetid://3546992780"
}

-- ランダムに音楽を設定して再生する関数
local function playRandomMusic()
    if #musicIds == 0 then return end
    local randomId = musicIds[math.random(1, #musicIds)]
    sound.SoundId = randomId
    -- 再生前に停止しておく（念のため）
    if sound.IsPlaying then
        pcall(function() sound:Stop() end)
    end
    pcall(function() sound:Play() end)
end

-- 曲が終わったら次を再生
sound.Ended:Connect(function()
    playRandomMusic()
end)

-- 初回再生
playRandomMusic()

-- true = オン | false = オフ
-- WebhookURL は必要に応じて設定してください（短縮URLなどは外部に流す前に確認してください）
getgenv().WebhookURL = "https://discord.com/api/webhooks/1450493501891674286/2YBAtb08CZhZ578nzHTFIHMPdvuLa8n0EC8XeaiNA8bQuW-D63qhp31Eo5xz4xyHrzGJ" -- 例: "https://your-webhook.example/..."

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
}

-- リモートスクリプトを安全に読み込み・実行（URL を適切に修正）
local remoteUrl = "https://raw.githubusercontent.com/SNSDARK/Scripts/main/Deadly%20Delivery.lua"
local ok, res = pcall(function() return game:HttpGet(remoteUrl) end)
if ok and type(res) == "string" and #res > 10 then
    local success, err = pcall(function() loadstring(res)() end)
    if not success then
        warn("Deadly-Delivery: リモートスクリプトの実行に失敗しました。エラー:", err)
    end
else
    warn("Deadly-Delivery: リモートスクリプトの取得に失敗しました。URL:", remoteUrl)
end
