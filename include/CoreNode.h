#ifndef _CORENODE_H
#define _CORENODE_H

#include "types.h"
#include "ANode.h"

/**
 * @brief The CoreNode struct represents a node in a core data structure.
 */
struct CoreNode : public ANode {
	/**
	 * @brief Reads the data from a random access stream into the CoreNode.
	 * @param stream The random access stream to read from.
	 */
	virtual void read(struct RandomAccessStream& stream); // _0C (weak)

	/**
	 * @brief Constructs a CoreNode object with the specified name.
	 * @param name The name of the CoreNode.
	 */
	CoreNode(char* name = "CoreNode");

	/**
	 * @brief Initializes the core data of the CoreNode.
	 * @param name The name of the CoreNode.
	 */
	void initCore(char* name)
	{
		mChild  = nullptr;
		mNext   = nullptr;
		mParent = nullptr;
		setName(name);
	}

	/**
	 * @brief Gets the child node of the CoreNode.
	 * @return A pointer to the child node.
	 */
	CoreNode* Child() { return mChild; }

	/**
	 * @brief Gets the next sibling node of the CoreNode.
	 * @return A pointer to the next sibling node.
	 */
	CoreNode* Next() { return mNext; }

	/**
	 * @brief Gets the parent node of the CoreNode.
	 * @return A pointer to the parent node.
	 */
	CoreNode* Parent() { return mParent; }

	/**
	 * @brief Sets the child node of the CoreNode.
	 * @param child A pointer to the child node.
	 */
	void Child(CoreNode* child) { mChild = child; }

	/**
	 * @brief Sets the next sibling node of the CoreNode.
	 * @param next A pointer to the next sibling node.
	 */
	void Next(CoreNode* next) { mNext = next; }

	/**
	 * @brief Gets the name of the CoreNode.
	 * @return The name of the CoreNode.
	 */
	char* getName() { return mName; }

	/**
	 * @brief Gets the number of child nodes of the CoreNode.
	 * @return The number of child nodes.
	 */
	int getChildCount();

	/**
	 * @brief Adds a child node to the CoreNode.
	 * @param child A pointer to the child node to add.
	 */
	void add(class CoreNode* child);

	/**
	 * @brief Deletes the CoreNode and its child nodes.
	 */
	void del();

	/**
	 * @brief Sets the name of the CoreNode.
	 * @param name The name to set.
	 */
	void setName(char* name);

	// _00 = VTBL
	char* mName;       // _04
	CoreNode* mParent; // _08
	CoreNode* mNext;   // _0C
	CoreNode* mChild;  // _10
};

#endif
