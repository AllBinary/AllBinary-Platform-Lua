-- Generated Code Do Not Modify
-- package org.allbinary.media.graphics.geography.pathfinding

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BaseBasicArrayListCache = require("org.allbinary.logic.util.cache.BaseBasicArrayListCache")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGeographicMapExtractedPathsCacheFactory = {}
BasicGeographicMapExtractedPathsCacheFactory.__index = BasicGeographicMapExtractedPathsCacheFactory
BasicGeographicMapExtractedPathsCacheFactory.className = "BasicGeographicMapExtractedPathsCacheFactory"
setmetatable(BasicGeographicMapExtractedPathsCacheFactory, {__index = BaseBasicArrayListCache})

function BasicGeographicMapExtractedPathsCacheFactory:_init_fields()
    self.maxConcurrentPaths = 0
    self.maxPaths = 0
end


function BasicGeographicMapExtractedPathsCacheFactory.getInstance()
        return BasicGeographicMapExtractedPathsCacheFactory.instance
end


function BasicGeographicMapExtractedPathsCacheFactory.new()
    local self = setmetatable(BaseBasicArrayListCache.new(), BasicGeographicMapExtractedPathsCacheFactory)
    self:_init_fields()
    return self
end


function BasicGeographicMapExtractedPathsCacheFactory:init(maxConcurrentPaths, maxPaths)
        if maxConcurrentPaths ~= self.maxConcurrentPaths then
            for index = maxConcurrentPaths, self.maxConcurrentPaths, -1 do
                self.list:add(BasicArrayListS.new(maxPaths))
            end
            self.maxConcurrentPaths = maxConcurrentPaths
        end
        self.maxPaths = maxPaths
end


function BasicGeographicMapExtractedPathsCacheFactory:getPaths()
        if self.list:size() > 0 then
            return self.list:removeAt(0)
        else
            return BasicArrayListS.new(self.maxPaths)
        end
end


function BasicGeographicMapExtractedPathsCacheFactory:release(list)
        for index = list:size() - 1, 0, -1 do
            BasicGeographicMapExtractedPathCacheFactory.getInstance():release(list:get(index))
        end
        list:clear()
        self.list:add(list)
end

BasicGeographicMapExtractedPathsCacheFactory.instance = BasicGeographicMapExtractedPathsCacheFactory.new()

return BasicGeographicMapExtractedPathsCacheFactory

