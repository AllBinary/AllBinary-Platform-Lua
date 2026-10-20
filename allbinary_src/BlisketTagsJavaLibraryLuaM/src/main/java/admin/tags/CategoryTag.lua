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
local CategoryHelperFactory = require("admin.taghelpers.CategoryHelperFactory")
local CategoryRequestHelperFactory = require("admin.taghelpers.CategoryRequestHelperFactory")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local CategoryTag = {}
CategoryTag.__index = CategoryTag
CategoryTag.className = "CategoryTag"
setmetatable(CategoryTag, {__index = TableTag})

function CategoryTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.xsl = nil
end


function CategoryTag.new()
    local self = setmetatable(TableTag.new(), CategoryTag)
    self:_init_fields()
        self:setTagHelperFactory(CategoryHelperFactory.new())
        self:setTagRequestHelperFactory(CategoryRequestHelperFactory.new())
    return self
end


function CategoryTag:setXsl(value)
        self.xsl = value
end


-- throws LicensingException
function CategoryTag:viewCategory()
        local try_ok, try_error = pcall(function()
            local anyType = CategoryRequestHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("viewCategory", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function CategoryTag:viewCategories()
        local try_ok, try_error = pcall(function()
            local anyType = CategoryRequestHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("viewCategories", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function CategoryTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                if self:getCommand() ~= nil then
                    self:getPropertiesHashMap():put(TransformInfoData.getInstance().TEMPLATEFILENAME, self.xsl)
                    if self:getCommand():compareTo(CategoryData.getInstance().VIEW) == 0 then
                        local output = self:viewCategory()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output)
                        end
                    elseif self:getCommand():compareTo(CategoryData.getInstance().VIEW) == 0 then
                        local output = self:viewCategories()
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

return CategoryTag

