-- Generated Code Do Not Modify
-- package org.allbinary.media.graphics.geography.pathfinding

local BaseBasicArrayListCache = require("org.allbinary.logic.util.cache.BaseBasicArrayListCache")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
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

local BasicGeographicMapExtractedPathCacheFactory = {}
BasicGeographicMapExtractedPathCacheFactory.__index = BasicGeographicMapExtractedPathCacheFactory
BasicGeographicMapExtractedPathCacheFactory.className = "BasicGeographicMapExtractedPathCacheFactory"
setmetatable(BasicGeographicMapExtractedPathCacheFactory, {__index = BaseBasicArrayListCache})

function BasicGeographicMapExtractedPathCacheFactory:_init_fields()
    self.maxConcurrentPaths = 0
    self.maxPaths = 0
end


function BasicGeographicMapExtractedPathCacheFactory.getInstance()
        return BasicGeographicMapExtractedPathCacheFactory.instance
end


function BasicGeographicMapExtractedPathCacheFactory.new()
    local self = setmetatable(BaseBasicArrayListCache.new(), BasicGeographicMapExtractedPathCacheFactory)
    self:_init_fields()
    return self
end


function BasicGeographicMapExtractedPathCacheFactory:init(maxConcurrentPaths, maxPaths)
        if maxConcurrentPaths ~= self.maxConcurrentPaths then
            for index = maxConcurrentPaths, self.maxConcurrentPaths, -1 do
                self.list:add(BasicArrayListS.new(maxPaths))
            end
            self.maxConcurrentPaths = maxConcurrentPaths
        end
        self.maxPaths = maxPaths
end


function BasicGeographicMapExtractedPathCacheFactory:getPath()
        if self.list:size() > 0 then
            return self.list:removeAt(0)
        else
            return BasicArrayListS.new(self.maxPaths)
        end
end


function BasicGeographicMapExtractedPathCacheFactory:release(list)
        list:clear()
        self.list:add(list)
end

BasicGeographicMapExtractedPathCacheFactory.instance = BasicGeographicMapExtractedPathCacheFactory.new()

return BasicGeographicMapExtractedPathCacheFactory

