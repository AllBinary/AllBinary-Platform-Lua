-- Generated Code Do Not Modify
-- package org.allbinary.android

local ToastUtil = {}
package.loaded["org.allbinary.android.ToastUtil"] = ToastUtil

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

local Context = java_lazy("android.content.Context")
local View = java_lazy("android.view.View")
local Toast = java_lazy("android.widget.Toast")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table ToastUtil is declared before the requires
ToastUtil.__index = ToastUtil
ToastUtil.className = "ToastUtil"
ToastUtil.javaClassName = "org.allbinary.android.ToastUtil"
--A member class instead of a local class using the method parameters since most of the converted languages do not have local classes.
    local MakeToast = {}
    MakeToast.__index = MakeToast
    MakeToast.className = "MakeToast"
    MakeToast.javaClassName = "org.allbinary.android.ToastUtil$MakeToast"
    MakeToast.java_implements = " Runnable "
    MakeToast.java_interfaces = function() return {Runnable} end
    ToastUtil.MakeToast = MakeToast

    function MakeToast:_init_fields()
        if self.context == nil then self.context = nil end
        if self.string_ == nil then self.string_ = nil end
        if self.time == nil then self.time = 0 end
    end
    

    function MakeToast._jinit(self, context, string_, time)
        MakeToast._init_fields(self)
            self.context = context
            self.string_ = string_
            self.time = time
        return self
    end

    function MakeToast.new(...)
        local self = setmetatable({}, MakeToast)
        MakeToast._jinit(self, ...)
        return self
    end
    

    function MakeToast:run()
            local logUtil = LogUtil.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                Toast.makeText(self.context, self.string_, self.time):show()
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end


function ToastUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function ToastUtil._jinit(self)
    ToastUtil._init_fields(self)
    return self
end

function ToastUtil.new()
    return ToastUtil._jinit(setmetatable({}, ToastUtil))
end


function ToastUtil.getInstance()
        return ToastUtil.instance_f
end


function ToastUtil:makeToast(view, context, message, time)
        view:post(MakeToast.new(context, message, time))
end

ToastUtil.instance_f = ToastUtil.new()

return ToastUtil

