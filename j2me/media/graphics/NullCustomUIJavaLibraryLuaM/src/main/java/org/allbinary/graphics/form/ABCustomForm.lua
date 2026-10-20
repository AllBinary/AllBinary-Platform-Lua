-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local CustomScreen = require("org.allbinary.graphics.form.CustomScreen")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABCustomForm = {}
ABCustomForm.__index = ABCustomForm
ABCustomForm.className = "ABCustomForm"
setmetatable(ABCustomForm, {__index = CustomScreen})

function ABCustomForm:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function ABCustomForm.new(title, items, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(CustomScreen.new(), ABCustomForm)
    self:_init_fields()
    return self
end


function ABCustomForm:getAllitems()
        return java_new_array(nil, 0)
end


function ABCustomForm:size()
        return 0
end


function ABCustomForm:setSelectedIndex(index)
end


function ABCustomForm:getSelectedIndex()
        return 0
end


function ABCustomForm:deleteAll()
end


function ABCustomForm:delete(itemNum)
end


function ABCustomForm:append(item)
        return -1
end


function ABCustomForm:insert(itemNum, item)
end


function ABCustomForm:set(itemNum, item)
end


function ABCustomForm:get(itemNum)
        return ABCustomItem.getNullInstance()
end


function ABCustomForm:getWidth()
        error(java_exception("RuntimeException"), 0)
end


function ABCustomForm:paint(graphics)
end


function ABCustomForm:getTitle()
        return StringUtil.getInstance().EMPTY_STRING
end

return ABCustomForm

