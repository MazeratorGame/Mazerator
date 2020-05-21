using UnrealBuildTool;

public class MazeratorTarget : TargetRules
{
	public MazeratorTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
		ExtraModuleNames.Add("Mazerator");
	}
}
