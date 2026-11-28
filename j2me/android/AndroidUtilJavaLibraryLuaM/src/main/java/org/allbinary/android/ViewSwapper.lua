-- Generated Code Do Not Modify
-- package org.allbinary.android

local ViewSwapper = {}
package.loaded["org.allbinary.android.ViewSwapper"] = ViewSwapper

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

local Activity = java_lazy("android.app.Activity")
local View = java_lazy("android.view.View")
local ViewGroup = java_lazy("android.view.ViewGroup")

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

-- class table ViewSwapper is declared before the requires
ViewSwapper.__index = ViewSwapper
ViewSwapper.className = "ViewSwapper"
ViewSwapper.javaClassName = "org.allbinary.android.ViewSwapper"

function ViewSwapper:_init_fields()
    if self.rootViewId == nil then self.rootViewId = 0 end
    if self.activity == nil then self.activity = nil end
    self.currentMainViewId = -1
    self.mainViewArray = ViewSwapper.NULL_VIEW_ARRAY
    self.topViewArray = ViewSwapper.NULL_VIEW_ARRAY
end


function ViewSwapper._jinit(self, activity, rootViewId)
    ViewSwapper._init_fields(self)
        self.activity = activity
        self.rootViewId = rootViewId
    return self
end

function ViewSwapper.new(...)
    local self = setmetatable({}, ViewSwapper)
    ViewSwapper._jinit(self, ...)
    return self
end


function ViewSwapper:setMainViews(viewArray)
        self.mainViewArray = viewArray
end


function ViewSwapper:setTopViewArray(topViewArray)
        self.topViewArray = topViewArray
end


function ViewSwapper:setMainView(id)
        local viewGroup = self.activity:findViewById(self.rootViewId)
        if not rawequal(id, self.currentMainViewId) then
            for index = 0, (self.topViewArray.n or #self.topViewArray) - 1 do
                viewGroup:removeView(self.topViewArray[index + 1])
            end
            for index = 0, (self.mainViewArray.n or #self.mainViewArray) - 1 do
                if not rawequal(id, self.mainViewArray[index + 1]:getId()) then
                    viewGroup:removeView(self.mainViewArray[index + 1])
                end
            end
            for index = 0, (self.mainViewArray.n or #self.mainViewArray) - 1 do
                if rawequal(id, self.mainViewArray[index + 1]:getId()) then
                    viewGroup:addView(self.mainViewArray[index + 1])
                    self.currentMainViewId = id
                end
            end
            for index = 0, (self.topViewArray.n or #self.topViewArray) - 1 do
                viewGroup:addView(self.topViewArray[index + 1])
            end
        end
end

ViewSwapper.NULL_VIEW_ARRAY = java_new_array(nil, 0)

return ViewSwapper

