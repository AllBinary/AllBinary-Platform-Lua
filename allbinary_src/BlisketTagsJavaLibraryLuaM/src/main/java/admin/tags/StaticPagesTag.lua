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
-- package admin.tags

-- local Method = require("java.lang.reflect.Method")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local StaticPagesHelperFactory = require("admin.taghelpers.StaticPagesHelperFactory")
local StaticPagesRequestHelperFactory = require("admin.taghelpers.StaticPagesRequestHelperFactory")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchData = require("org.allbinary.logic.control.search.SearchData")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TableTag = require("admin.tags.TableTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StaticPagesTag = {}
StaticPagesTag.__index = StaticPagesTag
StaticPagesTag.className = "StaticPagesTag"
setmetatable(StaticPagesTag, {__index = TableTag})

function StaticPagesTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.xslFile = nil
end


function StaticPagesTag.new()
    local self = setmetatable(TableTag.new(), StaticPagesTag)
    self:_init_fields()
        self:setTagHelperFactory(StaticPagesHelperFactory.new())
        self:setTagRequestHelperFactory(StaticPagesRequestHelperFactory.new())
    return self
end


function StaticPagesTag:setXsl(value)
        self.xslFile = value
end


-- throws LicensingException
function StaticPagesTag:generateStaticPages()
        local try_ok, try_error = pcall(function()
            local anyType = StaticPagesRequestHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("generateStaticPages", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function StaticPagesTag:makePublic()
        local try_ok, try_error = pcall(function()
            local anyType = StaticPagesRequestHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("makePublic", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function StaticPagesTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                if self:getCommand() ~= nil then
                    if self:getCommand():compareTo(SearchData.GENERATESTATICPAGES) == 0 then
                        self:getPropertiesHashMap():put(TransformInfoData.getInstance().TEMPLATEFILENAME, self.xslFile)
                        local output = self:generateStaticPages()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output)
                        end
                    elseif self:getCommand():compareTo(SearchData.MAKEPUBLIC) == 0 then
                        local output = self:makePublic()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output)
                        end
                    else
                        return TableTag.doStartTag(self)
                    end
                end
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return StaticPagesTag

