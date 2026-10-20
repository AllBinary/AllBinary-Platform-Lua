-- Generated Code Do Not Modify
-- package org.allbinary.android

local Context = require("android.content.Context")
local View = require("android.view.View")
local Toast = require("android.widget.Toast")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ToastUtil = {}
ToastUtil.__index = ToastUtil
ToastUtil.className = "ToastUtil"

function ToastUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function ToastUtil.new()
    local self = setmetatable({}, ToastUtil)
    self:_init_fields()
    return self
end


function ToastUtil.getInstance()
        return ToastUtil.instance
end


function ToastUtil:makeToast(view, context, message, time)
        local MakeToast = {}
        MakeToast.__index = MakeToast
        MakeToast.className = "MakeToast"

        function MakeToast:_init_fields()
            self.string = nil
        end
        

        function ToastUtil.new(string)
            local self = setmetatable({}, ToastUtil)
            self:_init_fields()
                self.string = string
            return self
        end
        

        function ToastUtil:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    Toast.makeText(self.context, self.string, self.time):show()
                end)
                if not try_ok then
                    local e = try_error
                    local commonStrings = CommonStrings.getInstance()
                    logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
                end
        end

        view:post(MakeToast.new(message))
end

ToastUtil.instance = ToastUtil.new()

return ToastUtil

