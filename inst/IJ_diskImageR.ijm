function alterImageSize(file) {
	selectWindow(file);
	picWidth = getWidth();
	picHeight = getHeight();
	if (picWidth > picHeight)
			run("Size...", "width=1000 constrain interpolation=None");
	if (picWidth < picHeight)
			run("Size...", "width=0 height=1000 constrain interpolation=None");
	if (picWidth == picHeight)
			run("Size...", "width=1000 height=0 constrain interpolation=None");
	
	}



function makeLineE(centerX, centerY, length, angle) { 
	angle = -angle * PI / 180; 
	dX = cos(angle) * length; 
	dY = sin(angle) * length; 
	makeLine(centerX, centerY, centerX + dX, centerY + dY); 
	} 

function findDisc(file){
	run("Clear Results");
	run("8-bit");
	setThreshold(181, 255);
	run("Convert to Mask");
	roiManager("reset"); 
	roiManager("Show All with labels");
	roiManager("Show All");
	run("Analyze Particles...", "size=2500-4500 circularity=0.50-1.00 show=Outlines display exclude add");
	if (nResults ==0){
		print("Trying parameter set 2");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(150, 255);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2500-4500 circularity=0.50-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying parameter set 3");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(81, 255);
		run("Convert to Mask");	
		run("Analyze Particles...", "size=2500-4500 circularity=0.50-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying parameter set 4");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(200, 255);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2500-4500 circularity=0.50-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying with less stringent circularity");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(181, 255);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2000-5000 circularity=0.2-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying with less stringent circularity, parameter set 2");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(150, 255);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2000-4000 circularity=0.20-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying with less stringent circularity, parameter set 3");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(81, 255);
		run("Convert to Mask");	
		run("Analyze Particles...", "size=2000-4000 circularity=0.20-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying with less stringent circularity, parameter set 4");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(200, 255);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2000-4000 circularity=0.20-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying with different thresholding, parameter set 1");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(125, 162);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2000-4000 circularity=0.20-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying with different thresholding, parameter set 2");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(113, 134);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2000-4000 circularity=0.20-1.00 show=Outlines display exclude add");
	}
	if (nResults ==0){
		print("Trying with different thresholding, parameter set 3");
		close();
		selectWindow(getTitle);
		run("Revert");	
		alterImageSize(getTitle);
		run("8-bit");
		setThreshold(113, 173);
		run("Convert to Mask");
		roiManager("reset"); 
		roiManager("Show All with labels");
		roiManager("Show All");
		run("Analyze Particles...", "size=2000-4000 circularity=0.20-1.00 show=Outlines display exclude add");
	}


	if (nResults ==0){
		print("Disk not identified, macro needs to be updated to account for photograph specifics.  Email Aleeza at gerst035@umn.edu for assistance");
	}
	if (nResults > 1){
		print("More than one disk identified. Please ensure no other circles are present in the photograph (e.g., in labels) and rerun.");
	}
}

//Actual work flow starts here:
//dir1 = "/Users/acgerstein/Documents/Postdoc/Research/Clinical_isolates/environments/disc_assay/Pos/130830Pos_48h/";
//dir2 = "/Users/acgerstein/Desktop";
//dir1 = getArgument();
print("Starting imageJ macro");
folders = getArgument;
//print(folders);
delimiter = "*";
parts=split(folders, delimiter);

dir1 = parts[0];
dir2 = parts[1];
knownDiam = parts[2];

print("Input directory: "+dir1);
print("Output directory: "+dir2);
print("Disk diameter: "+knownDiam);

list = getFileList(dir1);
print("Number of images: " + list.length);
setBatchMode(true);
for (i=0; i<list.length; i++){
//	print(i);
	showProgress(i+1, list.length);
	open(dir1 + list[i]);	
	print("Current image: "+list[i]);
	outputFolder = dir2;
//	print(outputFolder);

	//The filename is automatically set to be the title of the image (so title images accordingly
	filename = substring(getTitle, 0, lengthOf(getTitle)-4);
	name = getTitle;

	run("Set Measurements...", "area mean centroid center perimeter redirect=None decimal=0");
      run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel");
	alterImageSize(getTitle);
	findDisc(getTitle);
	close();
	run("Revert");
	alterImageSize(getTitle);
	centerX = getResult("X", 0);
	centerY = getResult("Y", 0);
	discDiam = 2*sqrt(getResult("Area")/3.1412);
	convert = discDiam/knownDiam;
//	run("Revert");
//	alterImageSize(getTitle);
//	run("Set Scale...", "distance=discDiam known=6 pixel=1 unit=mm");
	makePoint(centerX, centerY);
	run("Clear Results");
//      setMinAndMax(50, 200); 
      setMinAndMax(50, 250); 

//	makeLineE(centerX, centerY, 40, 0);
	makeLineE(centerX, centerY, 40*convert, 5);

	Angle=0;
	while (Angle < 360){
		Angle = Angle + 5;
		makeLineE(centerX, centerY, 40*convert, Angle);

		// Get profile and display values in "Results" window
		profile = getProfile();
		for (j=0; j<profile.length; j++){
			k = nResults;
			setResult("X", k, j);
			setResult("Value", k, profile[j]);
		}
		updateResults();

	// Plot profile
	Plot.create("Profile", "X", "Value", profile);
	}

	//Save as spreadsheet compatible text file
	saveAs("Results", outputFolder+filename+".txt");
	close();
}

