local diskie = {}

local function toHex(str)
    return (str:gsub('.', function(c)
        return string.format('%02X', string.byte(c))
    end))
end

local function toBase16(hex)
    return (hex:gsub('.', function(c)
        return string.format('%X', tonumber(c, 16))
    end))
end

local function toBase64(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r, b = '', string.byte(x)
        for i = 8, 1, -1 do r = r .. (b % 2^i - b % 2^(i-1) > 0 and '1' or '0') end
        return r
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i, i) == '1' and 2^(6-i) or 0) end
        return b:sub(c+1, c+1)
    end)..({ '', '==', '=' })[#data % 3 + 1])
end

local function sha256(str)
    local hash = require('sha2').sha256hex
    return hash(str)
end

local function md5(str)
    local md5 = require('md5')
    return md5.sumhexa(str)
end

local function aesEncrypt(str, key)
    local openssl = require('openssl')
    local cipher = openssl.cipher.get('aes-256-cbc')
    return cipher:encrypt(str, key)
end

function diskie.header(str, key)
    local hexEncoded = toHex(str)
    local base16Encoded = toBase16(hexEncoded)
    local base64Encoded = toBase64(base16Encoded)
    local shaEncoded = sha256(base64Encoded)
    local md5Encoded = md5(shaEncoded)

    if key then
        return aesEncrypt(md5Encoded, key)
    end

    return md5Encoded
end

return diskie
