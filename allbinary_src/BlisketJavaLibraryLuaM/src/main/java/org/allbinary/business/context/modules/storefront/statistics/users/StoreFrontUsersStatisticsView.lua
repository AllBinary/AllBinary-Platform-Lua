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
-- package org.allbinary.business.context.modules.storefront.statistics.users

local StoreFrontUsersStatisticsView = {}
package.loaded["org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsView"] = StoreFrontUsersStatisticsView

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

local HashMap = java_lazy("java.util.HashMap")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")

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

-- class table StoreFrontUsersStatisticsView is declared before the requires
StoreFrontUsersStatisticsView.__index = StoreFrontUsersStatisticsView
StoreFrontUsersStatisticsView.className = "StoreFrontUsersStatisticsView"
StoreFrontUsersStatisticsView.javaClassName = "org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsView"
StoreFrontUsersStatisticsView.java_implements = " DomNodeInterface "
StoreFrontUsersStatisticsView.java_interfaces = function() return {DomNodeInterface} end

function StoreFrontUsersStatisticsView:_init_fields()
    if self.storeFrontUsersStatisticsInterface == nil then self.storeFrontUsersStatisticsInterface = nil end
end


function StoreFrontUsersStatisticsView._jinit(self, storeFrontUsersStatisticsInterface)
    StoreFrontUsersStatisticsView._init_fields(self)
        self.storeFrontUsersStatisticsInterface = storeFrontUsersStatisticsInterface
    return self
end

function StoreFrontUsersStatisticsView.new(...)
    local self = setmetatable({}, StoreFrontUsersStatisticsView)
    StoreFrontUsersStatisticsView._jinit(self, ...)
    return self
end


-- throws Exception
function StoreFrontUsersStatisticsView:toXmlNode(document)
        local hashMap = self.storeFrontUsersStatisticsInterface:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, StoreFrontUsersStatisticsData.getInstance().NAME, hashMap)
        return node
end

return StoreFrontUsersStatisticsView

