-- Generated Code Do Not Modify
-- package org.allbinary.android

local Activity = require("android.app.Activity")
local View = require("android.view.View")
local ViewGroup = require("android.view.ViewGroup")

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

local ViewSwapper = {}
ViewSwapper.__index = ViewSwapper
ViewSwapper.className = "ViewSwapper"

function ViewSwapper:_init_fields()
    self.rootViewId = nil
    self.activity = nil
    self.currentMainViewId = -1
    self.mainViewArray = ViewSwapper.NULL_VIEW_ARRAY
    self.topViewArray = ViewSwapper.NULL_VIEW_ARRAY
end


function ViewSwapper.new(activity, rootViewId)
    local self = setmetatable({}, ViewSwapper)
    self:_init_fields()
        self.activity = activity
        self.rootViewId = rootViewId
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
        if id ~= self.currentMainViewId then
            for index = 0, (self.topViewArray.n or #self.topViewArray) - 1 do
                viewGroup:removeView(self.topViewArray[index + 1])
            end
            for index = 0, (self.mainViewArray.n or #self.mainViewArray) - 1 do
                if id ~= self.mainViewArray[index + 1]:getId() then
                    viewGroup:removeView(self.mainViewArray[index + 1])
                end
            end
            for index = 0, (self.mainViewArray.n or #self.mainViewArray) - 1 do
                if id == self.mainViewArray[index + 1]:getId() then
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

