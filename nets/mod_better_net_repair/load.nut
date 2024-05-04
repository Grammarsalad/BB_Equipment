
// load the hooks
foreach (file in ::IO.enumerateFiles(::ModBetterNetRepair.ID + "/hooks"))
{
	::include(file);
}