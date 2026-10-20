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
-- package org.allbinary.graphics.j2me.workarea.tools

local Node = require("org.w3c.dom.Node")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GraphicItemBuilder = {}
GraphicItemBuilder.__index = GraphicItemBuilder
GraphicItemBuilder.className = "GraphicItemBuilder"


function GraphicItemBuilder.new()
    local self = setmetatable({}, GraphicItemBuilder)
    return self
end


-- throws Exception
function GraphicItemBuilder.getInstance(node)
        local graphicItemName = node:getNodeName()
        if ((graphicItemName < PointsDomUtil.getInstance().LINES and -1) or (graphicItemName > PointsDomUtil.getInstance().LINES and 1) or 0) == 0 then
            return LinesGraphicItem.new(node)
        else
            error(java_exception("Exception", "Graphic Item Does Not Exist: " .. graphicItemName), 0)
        end
end

return GraphicItemBuilder

