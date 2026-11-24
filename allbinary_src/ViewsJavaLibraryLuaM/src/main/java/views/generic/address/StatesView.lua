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
-- package views.generic.address

local StatesView = {}
package.loaded["views.generic.address.StatesView"] = StatesView

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

local StreetAddressData = java_lazy("org.allbinary.business.user.address.StreetAddressData")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LineReader = java_lazy("org.allbinary.logic.io.LineReader")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table StatesView is declared before the requires
StatesView.__index = StatesView
StatesView.className = "StatesView"
StatesView.javaClassName = "views.generic.address.StatesView"
StatesView.java_implements = " DomNodeInterface "
StatesView.java_interfaces = function() return {DomNodeInterface} end

function StatesView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function StatesView._jinit(self)
    StatesView._init_fields(self)
    return self
end

function StatesView.new(...)
    local self = setmetatable({}, StatesView)
    StatesView._jinit(self, ...)
    return self
end


function StatesView:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            local node = document:createElement(StreetAddressData.STATES)
            local statesFile = tostring(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().LINEDATAPATH) .. "states.txt"
            local lineReader = LineReader.new(statesFile)
            while lineReader:hasNext() do
                local option = lineReader:next()
                node:appendChild(ModDomHelper.createNameValueNodes(document, StreetAddressData.STATE, option))
            end
            do return "__jreturn", node end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return StatesView

