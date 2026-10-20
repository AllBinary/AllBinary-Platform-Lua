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

local JPanel = require("org.allbinary.graphics.j2me.workarea.tools.JPanel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ToolJPanel = {}
ToolJPanel.__index = ToolJPanel
ToolJPanel.className = "ToolJPanel"
setmetatable(ToolJPanel, {__index = JPanel})

function ToolJPanel:_init_fields()
    self.arcJButton = nil
    self.charJButton = nil
    self.colorJList = nil
    self.colorJPanel = nil
    self.dottedArcJButton = nil
    self.dottedFillArcJButton = nil
    self.dottedFillRectJButton = nil
    self.dottedFillRountRectJButton = nil
    self.dottedLineJButton = nil
    self.dottedRectButton = nil
    self.fillArcJButton = nil
    self.fillRectJButton = nil
    self.fillRoundRectJButton = nil
    self.imageJButton = nil
    self.lineJButton = nil
    self.rectJButton = nil
    self.roundRectJButton = nil
    self.stringJButton = nil
end


function ToolJPanel.new()
    local self = setmetatable(JPanel.new(), ToolJPanel)
    self:_init_fields()
        self:initComponents()
    return self
end


function ToolJPanel:initComponents()
        self.lineJButton = JButton.new()
        self.rectJButton = JButton.new()
        self.arcJButton = JButton.new()
        self.stringJButton = JButton.new()
        self.charJButton = JButton.new()
        self.roundRectJButton = JButton.new()
        self.imageJButton = JButton.new()
        self.fillArcJButton = JButton.new()
        self.fillRectJButton = JButton.new()
        self.fillRoundRectJButton = JButton.new()
        self.dottedLineJButton = JButton.new()
        self.dottedRectButton = JButton.new()
        self.dottedArcJButton = JButton.new()
        self.dottedFillRectJButton = JButton.new()
        self.dottedFillArcJButton = JButton.new()
        self.dottedFillRountRectJButton = JButton.new()
        self.colorJPanel = JPanel.new()
        self.colorJList = JList.new()
        self:setLayout(GridLayout.new(17, 1))
        self.lineJButton:setFont(Font.new("Dialog", 0, 10))
        self.lineJButton:setText(LinesGraphicItem.getStaticName())
        self.lineJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mouseClicked(evt)
                self:lineJButtonMouseClicked(evt)
            end
            return o
        end)())
        self:add(self.lineJButton)
        self.rectJButton:setFont(Font.new("Dialog", 0, 10))
        self.rectJButton:setText("Rect")
        self.rectJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mouseClicked(evt)
                self:rectJButtonMouseClicked(evt)
            end
            return o
        end)())
        self:add(self.rectJButton)
        self.arcJButton:setFont(Font.new("Dialog", 0, 10))
        self.arcJButton:setText("Arc")
        self.arcJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:arcJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.arcJButton)
        self.stringJButton:setFont(Font.new("Dialog", 0, 10))
        self.stringJButton:setText("String")
        self.stringJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:stringJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.stringJButton)
        self.charJButton:setFont(Font.new("Dialog", 0, 10))
        self.charJButton:setText("Char")
        self.charJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:charJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.charJButton)
        self.roundRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.roundRectJButton:setText("Round Rect")
        self.roundRectJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:roundRectJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.roundRectJButton)
        self.imageJButton:setFont(Font.new("Dialog", 0, 10))
        self.imageJButton:setText("Image")
        self.imageJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:imageJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.imageJButton)
        self.fillArcJButton:setFont(Font.new("Dialog", 0, 10))
        self.fillArcJButton:setText("Fill Arc")
        self.fillArcJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:fillArcJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.fillArcJButton)
        self.fillRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.fillRectJButton:setText("Fill Rect")
        self.fillRectJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:fillRectJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.fillRectJButton)
        self.fillRoundRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.fillRoundRectJButton:setText("Fill Rnd Rect")
        self.fillRoundRectJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:fillRoundRectJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.fillRoundRectJButton)
        self.dottedLineJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedLineJButton:setText("Dot Line")
        self.dottedLineJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:dottedLineJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.dottedLineJButton)
        self.dottedRectButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedRectButton:setText("Dot Rect")
        self.dottedRectButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:dottedRectButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.dottedRectButton)
        self.dottedArcJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedArcJButton:setText("Dot Arc")
        self.dottedArcJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:dottedArcJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.dottedArcJButton)
        self.dottedFillRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedFillRectJButton:setText("Dot Fill Rect")
        self.dottedFillRectJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:dottedFillRectJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.dottedFillRectJButton)
        self.dottedFillArcJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedFillArcJButton:setText("Dot Fill Arc")
        self.dottedFillArcJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:dottedFillArcJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.dottedFillArcJButton)
        self.dottedFillRountRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedFillRountRectJButton:setText("Dot Fill Rnd Rect")
        self.dottedFillRountRectJButton:addMouseListener((function()
            local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                self:dottedFillRountRectJButtonMousePressed(evt)
            end
            return o
        end)())
        self:add(self.dottedFillRountRectJButton)
        self.colorJPanel:setLayout(GridLayout.new(1, 1))
        self.colorJPanel:add(self.colorJList)
        self:add(self.colorJPanel)
end


function ToolJPanel:dottedFillRountRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedFillRountRectJButton:getText())
end


function ToolJPanel:dottedFillArcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedFillArcJButton:getText())
end


function ToolJPanel:dottedFillRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedFillRectJButton:getText())
end


function ToolJPanel:dottedArcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedArcJButton:getText())
end


function ToolJPanel:dottedRectButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedRectButton:getText())
end


function ToolJPanel:dottedLineJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedLineJButton:getText())
end


function ToolJPanel:fillRoundRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.fillRoundRectJButton:getText())
end


function ToolJPanel:fillRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.fillRectJButton:getText())
end


function ToolJPanel:fillArcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.fillArcJButton:getText())
end


function ToolJPanel:imageJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.imageJButton:getText())
end


function ToolJPanel:roundRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.roundRectJButton:getText())
end


function ToolJPanel:charJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.charJButton:getText())
end


function ToolJPanel:stringJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.stringJButton:getText())
end


function ToolJPanel:arcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.arcJButton:getText())
end


function ToolJPanel:rectJButtonMouseClicked(evt)
        ToolFactory.getInstance():setSelectedTool(self.rectJButton:getText())
end


function ToolJPanel:lineJButtonMouseClicked(evt)
        ToolFactory.getInstance():setSelectedTool(self.lineJButton:getText())
end

return ToolJPanel

