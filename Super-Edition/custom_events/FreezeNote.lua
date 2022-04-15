function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
	if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'FreezeNote' then
		setPropertyFromGroup('unspawnNotes', i, 'texture', 'Freeze');
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
        end
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
if noteType == 'FreezeNote' then
   debugPrint('frozen')
   characterPlayAnim('boyfriend', 'hurt', true);
   setProperty('boyfriend.specialAnim', true);
   setProperty('boyfriend.stunned', true);
	
   runTimer('frozen', 2.5);
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'frozen' then
	debugPrint('unfrozen')
	setProperty('boyfriend.stunned', false);
	end
end