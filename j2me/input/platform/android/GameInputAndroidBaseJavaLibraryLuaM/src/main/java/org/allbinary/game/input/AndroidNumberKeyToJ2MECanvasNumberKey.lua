-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local AndroidNumberKeyToJ2MECanvasNumberKey = {}
package.loaded["org.allbinary.game.input.AndroidNumberKeyToJ2MECanvasNumberKey"] = AndroidNumberKeyToJ2MECanvasNumberKey

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local KeyEvent = java_lazy("android.view.KeyEvent")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AndroidNumberKeyToJ2MECanvasNumberKey is declared before the requires
AndroidNumberKeyToJ2MECanvasNumberKey.__index = AndroidNumberKeyToJ2MECanvasNumberKey
AndroidNumberKeyToJ2MECanvasNumberKey.className = "AndroidNumberKeyToJ2MECanvasNumberKey"
AndroidNumberKeyToJ2MECanvasNumberKey.javaClassName = "org.allbinary.game.input.AndroidNumberKeyToJ2MECanvasNumberKey"


function AndroidNumberKeyToJ2MECanvasNumberKey.init()
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_0 + 1] = Canvas.KEY_NUM0
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_1 + 1] = Canvas.KEY_NUM1
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_2 + 1] = Canvas.KEY_NUM2
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_3 + 1] = Canvas.KEY_NUM3
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_4 + 1] = Canvas.KEY_NUM4
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_5 + 1] = Canvas.KEY_NUM5
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_6 + 1] = Canvas.KEY_NUM6
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_7 + 1] = Canvas.KEY_NUM7
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_8 + 1] = Canvas.KEY_NUM8
        AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[KeyEvent.KEYCODE_9 + 1] = Canvas.KEY_NUM9
end


function AndroidNumberKeyToJ2MECanvasNumberKey._jinit(self)
    return self
end

function AndroidNumberKeyToJ2MECanvasNumberKey.new(...)
    local self = setmetatable({}, AndroidNumberKeyToJ2MECanvasNumberKey)
    AndroidNumberKeyToJ2MECanvasNumberKey._jinit(self, ...)
    return self
end


function AndroidNumberKeyToJ2MECanvasNumberKey.getKey(key)
        if key < (AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap.n or #AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap) then
            local value = AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap[key + 1]
            if value ~= 0 then
                return value
            end
        end
        return key
end

AndroidNumberKeyToJ2MECanvasNumberKey.androidtoJavaMicroEditionKeyMap = java_typed_array("I", java_new_array(0, 17))

return AndroidNumberKeyToJ2MECanvasNumberKey

