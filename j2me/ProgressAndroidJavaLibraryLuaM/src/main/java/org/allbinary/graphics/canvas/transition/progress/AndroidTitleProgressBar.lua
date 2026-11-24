--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.graphics.canvas.transition.progress

local AndroidTitleProgressBar = {}
package.loaded["org.allbinary.graphics.canvas.transition.progress.AndroidTitleProgressBar"] = AndroidTitleProgressBar

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local NullProgressActivity = java_lazy("org.allbinary.android.activity.NullProgressActivity")
local ProgressActivityInterface = java_lazy("org.allbinary.android.activity.ProgressActivityInterface")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table AndroidTitleProgressBar is declared before the requires
AndroidTitleProgressBar.__index = AndroidTitleProgressBar
AndroidTitleProgressBar.className = "AndroidTitleProgressBar"
AndroidTitleProgressBar.javaClassName = "org.allbinary.graphics.canvas.transition.progress.AndroidTitleProgressBar"
setmetatable(AndroidTitleProgressBar, {__index = ProgressCanvas})
local TitleProgressBarSetProgressRunnable = {}
    TitleProgressBarSetProgressRunnable.__index = TitleProgressBarSetProgressRunnable
    TitleProgressBarSetProgressRunnable.className = "TitleProgressBarSetProgressRunnable"
    TitleProgressBarSetProgressRunnable.javaClassName = "org.allbinary.graphics.canvas.transition.progress.AndroidTitleProgressBar$TitleProgressBarSetProgressRunnable"
    TitleProgressBarSetProgressRunnable.java_implements = " Runnable "
    TitleProgressBarSetProgressRunnable.java_interfaces = function() return {Runnable} end
    AndroidTitleProgressBar.TitleProgressBarSetProgressRunnable = TitleProgressBarSetProgressRunnable

    function TitleProgressBarSetProgressRunnable:_init_fields()
        if self.androidTitleProgressBar == nil then self.androidTitleProgressBar = nil end
    end
    

    function AndroidTitleProgressBar._jinit(self, androidTitleProgressBar)
        AndroidTitleProgressBar._init_fields(self)
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end

    function AndroidTitleProgressBar.new(...)
        local self = setmetatable({}, AndroidTitleProgressBar)
        AndroidTitleProgressBar._jinit(self, ...)
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                local value = java_int(self.androidTitleProgressBar:getValue())
                self.androidTitleProgressBar.progressActivity:onTitleProgressBarSetProgress(value)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end

local TitleProgressBarPortionSetProgressRunnable = {}
    TitleProgressBarPortionSetProgressRunnable.__index = TitleProgressBarPortionSetProgressRunnable
    TitleProgressBarPortionSetProgressRunnable.className = "TitleProgressBarPortionSetProgressRunnable"
    TitleProgressBarPortionSetProgressRunnable.javaClassName = "org.allbinary.graphics.canvas.transition.progress.AndroidTitleProgressBar$TitleProgressBarPortionSetProgressRunnable"
    TitleProgressBarPortionSetProgressRunnable.java_implements = " Runnable "
    TitleProgressBarPortionSetProgressRunnable.java_interfaces = function() return {Runnable} end
    AndroidTitleProgressBar.TitleProgressBarPortionSetProgressRunnable = TitleProgressBarPortionSetProgressRunnable

    function TitleProgressBarPortionSetProgressRunnable:_init_fields()
        if self.androidTitleProgressBar == nil then self.androidTitleProgressBar = nil end
    end
    

    function AndroidTitleProgressBar._jinit(self, androidTitleProgressBar)
        AndroidTitleProgressBar._init_fields(self)
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end

    function AndroidTitleProgressBar.new(...)
        local self = setmetatable({}, AndroidTitleProgressBar)
        AndroidTitleProgressBar._jinit(self, ...)
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                local value = java_int((self.androidTitleProgressBar:getValue() + self.androidTitleProgressBar:getMaxValue() / self.androidTitleProgressBar.portion))
                self.androidTitleProgressBar.progressActivity:onTitleProgressBarSetProgress(value)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end

local ShowTitleProgressBarRunnable = {}
    ShowTitleProgressBarRunnable.__index = ShowTitleProgressBarRunnable
    ShowTitleProgressBarRunnable.className = "ShowTitleProgressBarRunnable"
    ShowTitleProgressBarRunnable.javaClassName = "org.allbinary.graphics.canvas.transition.progress.AndroidTitleProgressBar$ShowTitleProgressBarRunnable"
    ShowTitleProgressBarRunnable.java_implements = " Runnable "
    ShowTitleProgressBarRunnable.java_interfaces = function() return {Runnable} end
    AndroidTitleProgressBar.ShowTitleProgressBarRunnable = ShowTitleProgressBarRunnable

    function ShowTitleProgressBarRunnable:_init_fields()
        if self.androidTitleProgressBar == nil then self.androidTitleProgressBar = nil end
    end
    

    function AndroidTitleProgressBar._jinit(self, androidTitleProgressBar)
        AndroidTitleProgressBar._init_fields(self)
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end

    function AndroidTitleProgressBar.new(...)
        local self = setmetatable({}, AndroidTitleProgressBar)
        AndroidTitleProgressBar._jinit(self, ...)
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                local maxValue = java_int(self.androidTitleProgressBar:getMaxValue())
                self.androidTitleProgressBar.progressActivity:onShowTitleProgressBar(maxValue, false)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end

local DismissTitleProgressBarRunnable = {}
    DismissTitleProgressBarRunnable.__index = DismissTitleProgressBarRunnable
    DismissTitleProgressBarRunnable.className = "DismissTitleProgressBarRunnable"
    DismissTitleProgressBarRunnable.javaClassName = "org.allbinary.graphics.canvas.transition.progress.AndroidTitleProgressBar$DismissTitleProgressBarRunnable"
    DismissTitleProgressBarRunnable.java_implements = " Runnable "
    DismissTitleProgressBarRunnable.java_interfaces = function() return {Runnable} end
    AndroidTitleProgressBar.DismissTitleProgressBarRunnable = DismissTitleProgressBarRunnable

    function DismissTitleProgressBarRunnable:_init_fields()
        if self.androidTitleProgressBar == nil then self.androidTitleProgressBar = nil end
    end
    

    function AndroidTitleProgressBar._jinit(self, androidTitleProgressBar)
        AndroidTitleProgressBar._init_fields(self)
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end

    function AndroidTitleProgressBar.new(...)
        local self = setmetatable({}, AndroidTitleProgressBar)
        AndroidTitleProgressBar._jinit(self, ...)
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                self.androidTitleProgressBar.progressActivity:onDismissTitleProgressBar()
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end


function AndroidTitleProgressBar:_init_fields()
    self.showTitleProgressBarRunnable = ShowTitleProgressBarRunnable.new(self)
    self.dismissTitleProgressBarRunnable = DismissTitleProgressBarRunnable.new(self)
    self.progressDialogPortionSetProgressRunnable = TitleProgressBarPortionSetProgressRunnable.new(self)
    self.progressDialogSetProgressRunnable = TitleProgressBarSetProgressRunnable.new(self)
    self.progressActivity = NullProgressActivity.NULL_PROGRESS_ACTIVITY
    self.portion = 0
end


function AndroidTitleProgressBar._jinit(self, title, backgroundBasicColor, foregroundBasicColor)
    java_super_init(ProgressCanvas, self, title, backgroundBasicColor, foregroundBasicColor)
    AndroidTitleProgressBar._init_fields(self)
        -- super(...) made self above
    return self
end

function AndroidTitleProgressBar.new(...)
    local self = setmetatable({}, AndroidTitleProgressBar)
    AndroidTitleProgressBar._jinit(self, ...)
    return self
end


function AndroidTitleProgressBar:init(activity)
        self.progressActivity = activity
end
java_overload(AndroidTitleProgressBar, "init", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ProgressActivityInterface")) end)


function AndroidTitleProgressBar:isInitialized()
        if self.progressActivity ~= NullProgressActivity.NULL_PROGRESS_ACTIVITY then
            return true
        else
            return false
        end
end
java_overload(AndroidTitleProgressBar, "isInitialized", 0)


function AndroidTitleProgressBar:start()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START_METHOD_NAME)
            java_super(ProgressCanvas, "start", 0)(self)
            self.progressActivity:runOnUiThread(self.showTitleProgressBarRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end
java_overload(AndroidTitleProgressBar, "start", 0)


function AndroidTitleProgressBar:end_()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.END_METHOD_NAME)
            self.progressActivity:runOnUiThread(self.dismissTitleProgressBarRunnable)
            java_super(ProgressCanvas, "end_", 0)(self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.END_METHOD_NAME, e)
        end
end
java_overload(AndroidTitleProgressBar, "end_", 0)


function AndroidTitleProgressBar:addPortion(value, text, index)
        local try_ok, try_error, try_value = pcall(function()
            java_super(ProgressCanvas, "addPortion", 3)(self, value, text, index)
            self.portion = value
            self.progressActivity:runOnUiThread(self.progressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end
java_overload(AndroidTitleProgressBar, "addPortion", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)


function AndroidTitleProgressBar:addNormalPortion(value, text)
        local try_ok, try_error, try_value = pcall(function()
            java_super(ProgressCanvas, "addNormalPortion", 2)(self, value, text)
            self.portion = value
            self.progressActivity:runOnUiThread(self.progressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end
java_overload(AndroidTitleProgressBar, "addNormalPortion", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") end)


function AndroidTitleProgressBar:setValue(value)
        local try_ok, try_error, try_value = pcall(function()
            java_super(ProgressCanvas, "setValue", 1)(self, value)
            self.progressActivity:runOnUiThread(self.progressDialogSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setValue", e)
        end
end
java_overload(AndroidTitleProgressBar, "setValue", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AndroidTitleProgressBar:waitUntilDisplayed()
end
java_overload(AndroidTitleProgressBar, "waitUntilDisplayed", 0)


function AndroidTitleProgressBar:paint(graphics)
end
java_overload(AndroidTitleProgressBar, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return AndroidTitleProgressBar

