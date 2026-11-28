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
-- package org.allbinary.canvas

local AndroidGameStatistics = {}
package.loaded["org.allbinary.canvas.AndroidGameStatistics"] = AndroidGameStatistics

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

local View = java_lazy("android.view.View")
local BaseViewWrapper = java_lazy("org.allbinary.android.view.BaseViewWrapper")
local ViewWrapper = java_lazy("org.allbinary.android.view.ViewWrapper")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BaseGameStatistics = require("org.allbinary.canvas.BaseGameStatistics")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table AndroidGameStatistics is declared before the requires
AndroidGameStatistics.__index = AndroidGameStatistics
AndroidGameStatistics.className = "AndroidGameStatistics"
AndroidGameStatistics.javaClassName = "org.allbinary.canvas.AndroidGameStatistics"
setmetatable(AndroidGameStatistics, {__index = BaseGameStatistics})

function AndroidGameStatistics:_init_fields()
    self.view = BaseViewWrapper.NULL_VIEW_WRAPPER
    if self.totalOnDraws == nil then self.totalOnDraws = 0 end
    self.ANDROID_STRING_ARRAY = java_new_array(nil, 14)
    self.TOTAL_ONDRAWS = " Total onDraws: "
    self.ONDRAWS_RATE = " onDraws(/10) Sec: "
end


function AndroidGameStatistics._jinit(self)
    java_super_init(BaseGameStatistics, self)
    AndroidGameStatistics._init_fields(self)
        local stringUtil = StringUtil.getInstance()
        for index = 0, (self.ANDROID_STRING_ARRAY.n or #self.ANDROID_STRING_ARRAY) - 1 do
            self.ANDROID_STRING_ARRAY[index + 1] = stringUtil.EMPTY_STRING
        end
    return self
end

function AndroidGameStatistics.new(...)
    local self = setmetatable({}, AndroidGameStatistics)
    AndroidGameStatistics._jinit(self, ...)
    return self
end


function AndroidGameStatistics:initView(view)
        java_super(BaseGameStatistics, "init", 0)(self)
        self.view = ViewWrapper.new(view)
        self.totalOnDraws = 0
end
java_overload(AndroidGameStatistics, "initView", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "View")) end)


function AndroidGameStatistics:process()
        self.view:postInvalidate()
end
java_overload(AndroidGameStatistics, "process", 0)


function AndroidGameStatistics:nextOnDraw()
        self.totalOnDraws = self.totalOnDraws + 1
end
java_overload(AndroidGameStatistics, "nextOnDraw", 0)


function AndroidGameStatistics:toStringArray()
        local stringArray = java_super(BaseGameStatistics, "toStringArray", 0)(self)
        for index = 0, (stringArray.n or #stringArray) - 1 do
            self.ANDROID_STRING_ARRAY[index + 1] = stringArray[index + 1]
        end
        local totalTime = self:getTimeDelayHelper():getElapsed(self.gameTickTimeDelayHelper.startTime)
        totalTime = (java_idiv(totalTime, 10000))
        self.ANDROID_STRING_ARRAY[11] = self.TOTAL_ONDRAWS
        self.ANDROID_STRING_ARRAY[12] = tostring(self.totalOnDraws)
        self.ANDROID_STRING_ARRAY[13] = self.ONDRAWS_RATE
        self.ANDROID_STRING_ARRAY[14] = tostring(java_idiv(self.totalOnDraws, totalTime))
        return self.ANDROID_STRING_ARRAY
end
java_overload(AndroidGameStatistics, "toStringArray", 0)


function AndroidGameStatistics:toString()
        local totalTime = self:getTimeDelayHelper():getElapsed(self.gameTickTimeDelayHelper.startTime)
        totalTime = (java_idiv(totalTime, 1000))
        if totalTime > 0 then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(java_super(BaseGameStatistics, "toStringAt", 1)(self, totalTime))
            if self.totalOnDraws > 0 then
                stringBuffer:append(self.TOTAL_ONDRAWS)
                stringBuffer:append(tostring(self.totalOnDraws))
                stringBuffer:append(self.ONDRAWS_RATE)
                local drawsOverTime = tostring(java_idiv(self.totalOnDraws, totalTime))
                stringBuffer:append(drawsOverTime)
            end
            return tostring(stringBuffer)
        else
            return self.NOT
        end
end
java_overload(AndroidGameStatistics, "toString", 0)
AndroidGameStatistics.__tostring = function(self) return self:toString() end

return AndroidGameStatistics

