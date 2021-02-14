module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving Eq

-- Clock 을 생성할 때 아래 제약을 만족하게 변환
-- 0 <= min <= 60 && 0 <= hour <= 24
fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock (mod (hour + q) 24) r
  where (q, r) = divMod min 60

format :: Int -> String
format num
  | length str == 1 = "0" ++ str
  | otherwise = str
  where str = show num

toString :: Clock -> String
toString (Clock hour min) =
  format hour ++ ":" ++ format min

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min =
    add (Clock hour min)

add :: Clock -> Clock -> Clock
add (Clock hour1 min1) (Clock hour2 min2) =
  fromHourMin (hour1 + hour2) (min1 + min2)
