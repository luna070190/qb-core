local Translations = {
    error = {
        not_online = '玩家不在線',
        wrong_format = '格式錯誤',
        missing_args = '請輸入必須參數 (x, y, z)',
        missing_args2 = '請輸入所有參數!',
        no_access = '你沒有權限',
        company_too_poor = '你的老闆破產了',
        item_not_exist = '物品不存在',
        too_heavy = '背包已滿'
    },
    success = {},
    info = {
        received_paycheck = '你收到了你的工資 $%{value}',
        job_info = '職業: %{value} | 職位: %{value2} | 狀態: %{value3}',
        gang_info = '幫派: %{value} | 級別: %{value2}',
        on_duty = '你現在上班了!',
        off_duty = '你現在下班了!'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
