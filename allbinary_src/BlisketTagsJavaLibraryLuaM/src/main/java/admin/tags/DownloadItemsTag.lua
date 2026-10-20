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

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local Tag = require("javax.servlet.jsp.tagext.Tag")
local DownloadItemsHelperFactory = require("admin.taghelpers.DownloadItemsHelperFactory")
local DownloadItemsRequestHelperFactory = require("admin.taghelpers.DownloadItemsRequestHelperFactory")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
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

local DownloadItemsTag = {}
DownloadItemsTag.__index = DownloadItemsTag
DownloadItemsTag.className = "DownloadItemsTag"
setmetatable(DownloadItemsTag, {__index = TableTag})


function DownloadItemsTag.new()
    local self = setmetatable(TableTag.new(), DownloadItemsTag)
        self:setTagHelperFactory(DownloadItemsHelperFactory.new())
        self:setTagRequestHelperFactory(DownloadItemsRequestHelperFactory.new())
    return self
end


-- throws JspTagException
function DownloadItemsTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                if self:getCommand() ~= nil then
                    if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.BACKUP) ~= 0 and self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.RESTORE) ~= 0 and self:getCommand():compareTo(self.commonStrings.CREATE) ~= 0 and self:getCommand():compareTo(self.commonStrings.DROP) ~= 0 then
                        local parentTag = self:getParent()
                        ParentInventoryTagHelper.getInstance():isValid(self, parentTag)
                        self:getPropertiesHashMap():put(AbTagData.PARENT, parentTag)
                    end
                    return TableTag.doStartTag(self)
                end
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return DownloadItemsTag

